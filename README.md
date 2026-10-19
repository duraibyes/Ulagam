# Ulagam

Tamil to American English, on your phone. Later target languages (Dutch next) use the same word cards, cache, and modules.

This first build is **Word World**: themed categories, a seed of about 1,500 words, a short level check (A1–C1), Settings for a Gemini API key, saved words, and local backup of your profile.

## Folder structure

```
lib/
  main.dart                 startup, seed the database
  app.dart                  theme and first screen
  providers.dart            Riverpod
  core/
    ai/                     LanguageAi interface, Gemini, file cache
    database/               Drift tables, seed import
    level/                  CEFR A1–C1
    review/                 SM-2 (used when a word is saved)
    settings/               API key in secure storage
    theme/
  features/
    placement/              first-launch reading + speaking check
    word_world/             categories, card, saved list
    settings/
    shell/
assets/seed/words.json      bundled word book
tool/                       rebuilds the seed from tool/vocab/*.txt
```

## Data model

- **Category** — id, English name, Tamil name, emoji, sort order.
- **Word card** — Tamil script, transliteration, American English, IPA, simple pronunciation, part of speech, CEFR, emoji or cached picture, cached audio, usage note, common mistake, optional British note, optional Dutch note, two example sentences, origin (`seed` or `ai`), saved flag.
- **Language** — source is Tamil (`ta`). Target is stored on the profile (`en` now, `nl` ready). Every word row has `targetLang`, so a Dutch pack does not overwrite English.
- **Review schedule** — SM-2 row created when you save a word: ease, interval, repetitions, lapses, due date. The review screen is a later module.

## Seed JSON

`assets/seed/words.json`:

```json
{
  "version": 1,
  "sourceLanguage": "ta",
  "targetLanguage": "en",
  "variety": "American English",
  "categories": [
    {"id": "emotions", "nameEn": "Emotions", "nameTa": "உணர்வுகள்", "emoji": "😊", "sort": 10}
  ],
  "words": [
    {
      "id": "en.emotions.happy",
      "categoryId": "emotions",
      "cefr": "A1",
      "tamil": "மகிழ்ச்சி",
      "transliteration": "magizhchi",
      "english": "happy",
      "ipa": "/ˈhæp.i/",
      "pronunciation": "HAP-ee",
      "partOfSpeech": "adjective",
      "emoji": "😊",
      "examples": [
        {"kind": "simple", "english": "It is happy.", "tamil": "இது மகிழ்ச்சியாக இருக்கிறது."},
        {"kind": "natural", "english": "This one looks happy.", "tamil": "இது மகிழ்ச்சியாக தெரிகிறது."}
      ],
      "usageNote": "...",
      "commonMistakes": "...",
      "britishNote": null,
      "dutchNote": null
    }
  ]
}
```

Rebuild it with `python tool/build_seed.py` after editing `tool/vocab/*.txt`.

## Gemini

Checked against Google AI docs on 19 Oct 2026:

| Job | Model |
| --- | --- |
| Text | `gemini-3.8-flash` |
| Pictures | `gemini-nano-banana-2.1` |
| Voice | `gemini-3.8-flash-lite-tts` |
| Speech check (later) | `gemini-3.8-flash` audio input |

Paste the key in Settings. It is stored with `flutter_secure_storage`. The same picture or audio is written under the app documents folder and is not requested again.

`LanguageAi` is the plug-in point. `UnavailableLanguageAi` is the placeholder for Claude and OpenAI.

Vercel hosts websites. It does not build Flutter Android APKs. The GitHub Actions workflow does.

## Install a release APK

Local command, from this folder, after Flutter and the Android SDK are installed:

```
flutter pub get
dart run build_runner build
flutter build apk --release
```

The APK is `build/app/outputs/flutter-apk/app-release.apk`.

Without `android/key.properties`, that release APK is signed with the debug key so you can install it on your own phone. Play Store builds need your own keystore.

### Put it on the phone

1. Copy `app-release.apk` to the phone (USB, Drive, or the GitHub Actions artifact).
2. On the phone, open the file.
3. If Android asks, allow installs from that app (Files or Chrome).
4. Tap Install. Ulagam does not need a login.
5. Updates: install a newer APK over the old one. Use the same signing key, or Android will refuse the update and you would have to uninstall first (that deletes on-phone data).

### Download it from GitHub

Push to `main`. Open the repo → Actions → **Android release APK** → the latest run → artifact `ulagam-release-apk`.

### Create a signing keystore and keep it safe

You need Java (`keytool` comes with a JDK).

```
keytool -genkeypair -v -keystore ulagam-upload.jks -keyalg RSA -keysize 2048 -validity 10000 -alias ulagam
```

- Store the `.jks` file outside this git repo, and keep a copy in a password manager or an encrypted drive. If you lose it, you cannot publish updates under the same app identity.
- Do not commit the file or the passwords. `android/.gitignore` already ignores `*.jks` and `key.properties`.

Create `android/key.properties` (this file stays on your machine):

```
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=ulagam
storeFile=../path/to/ulagam-upload.jks
```

`storeFile` is relative to `android/app/` if you use a path like `upload-keystore.jks` next to the app module. A path starting with `../` is relative to `android/app/` as well. Put the file where that path resolves, or use an absolute path.

For GitHub Actions, add repository secrets:

- `ANDROID_KEYSTORE_BASE64` — output of `base64` (or `[Convert]::ToBase64String([IO.File]::ReadAllBytes("ulagam-upload.jks"))` in PowerShell)
- `ANDROID_STORE_PASSWORD`
- `ANDROID_KEY_PASSWORD`
- `ANDROID_KEY_ALIAS` — `ulagam`

Until those secrets exist, Actions still uploads an installable debug-signed APK.
