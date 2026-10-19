"""Build assets/seed/words.json for Ulagam.

Line format (pipe-separated, empty fields allowed):
cat|en|ta|tr|ipa|say|pos|cefr|emoji|kind|british|dutch|pred|sEn|sTa|nEn|nTa

kind: c count noun, u uncountable, p person, r relation, a adjective, v verb
pred: Tamil form used inside "இது {pred} இருக்கிறது" for adjectives
Custom examples override templates when sEn is set.
"""

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
VOCAB = Path(__file__).resolve().parent / "vocab"
OUT = ROOT / "assets" / "seed" / "words.json"

CATEGORIES = [
    ("emotions", "Emotions", "உணர்வுகள்", "😊", 10),
    ("dishes", "Dishes", "உணவுகள்", "🍽️", 20),
    ("fruits", "Fruits", "பழங்கள்", "🍎", 30),
    ("vegetables", "Vegetables", "காய்கறிகள்", "🥕", 40),
    ("spices", "Spices", "மசாலா", "🌶️", 50),
    ("animals", "Animals", "விலங்குகள்", "🐘", 60),
    ("birds", "Birds", "பறவைகள்", "🦜", 70),
    ("insects", "Insects", "பூச்சிகள்", "🐝", 80),
    ("sea_life", "Sea life", "கடல் உயிரினங்கள்", "🐟", 90),
    ("weather", "Weather", "வானிலை", "🌦️", 100),
    ("nature", "Nature", "இயற்கை", "🌿", 110),
    ("body", "Body", "உடல்", "🫀", 120),
    ("health", "Health", "உடல்நலம்", "🩺", 130),
    ("family", "Family", "குடும்பம்", "👨‍👩‍👧", 140),
    ("home", "Home", "வீடு", "🏠", 150),
    ("kitchen", "Kitchen", "சமையலறை", "🍳", 160),
    ("clothes", "Clothes", "உடைகள்", "👕", 170),
    ("colors", "Colors", "நிறங்கள்", "🎨", 180),
    ("shapes", "Shapes", "வடிவங்கள்", "🔺", 190),
    ("time", "Time", "நேரம்", "⏰", 200),
    ("money", "Money", "பணம்", "💵", 210),
    ("shopping", "Shopping", "கடை", "🛒", 220),
    ("transport", "Transport", "போக்குவரத்து", "🚌", 230),
    ("travel", "Travel", "பயணம்", "✈️", 240),
    ("jobs", "Jobs", "தொழில்கள்", "💼", 250),
    ("school", "School", "பள்ளி", "📚", 260),
    ("office", "Office", "அலுவலகம்", "🗂️", 270),
    ("tech", "Tech", "தொழில்நுட்பம்", "💻", 280),
    ("sports", "Sports", "விளையாட்டு", "⚽", 290),
    ("festivals", "Festivals", "திருவிழாக்கள்", "🎉", 300),
    ("verbs", "Verbs", "வினைச்சொற்கள்", "🏃", 310),
    ("adjectives", "Adjectives", "பெயரடைகள்", "✨", 320),
]


def slug(text: str) -> str:
    lowered = text.lower().replace("'", "")
    return re.sub(r"[^a-z0-9]+", "-", lowered).strip("-")


def article(en: str, kind: str) -> str:
    if kind == "u":
        return ""
    word = en.lower().split()[0]
    if word in {"hour", "honest", "heir"}:
        return "an"
    return "an" if word[:1] in "aeiou" else "a"


def examples_for(row: dict) -> list[dict]:
    if row["s_en"]:
        return [
            {"kind": "simple", "english": row["s_en"], "tamil": row["s_ta"]},
            {"kind": "natural", "english": row["n_en"], "tamil": row["n_ta"]},
        ]
    en, ta, kind, cat = row["en"], row["ta"], row["kind"], row["cat"]
    art = article(en, kind)
    art_sp = f"{art} " if art else ""
    if row["pos"] == "adverb":
        pred = row["pred"] or ta
        return [
            {"kind": "simple", "english": f"Please say it {en}.", "tamil": f"தயவுசெய்து அதை {pred} சொல்லுங்கள்."},
            {"kind": "natural", "english": f"She answered {en}.", "tamil": f"அவள் {pred} பதில் சொன்னாள்."},
        ]
    if kind == "a":
        pred = row["pred"] or ta
        return [
            {"kind": "simple", "english": f"It is {en}.", "tamil": f"இது {pred} இருக்கிறது."},
            {"kind": "natural", "english": f"This one looks {en}.", "tamil": f"இது {pred} தெரிகிறது."},
        ]
    if kind == "v":
        raise SystemExit(f"Verb needs custom sentences: {en}")
    if kind == "r":
        return [
            {"kind": "simple", "english": f"This is my {en}.", "tamil": f"இவர் என் {ta}."},
            {"kind": "natural", "english": f"My {en} is at home.", "tamil": f"என் {ta} வீட்டில் இருக்கிறார்."},
        ]
    if kind == "p":
        return [
            {"kind": "simple", "english": f"Alex is {art_sp}{en}.", "tamil": f"அலெக்ஸ் ஒரு {ta}."},
            {"kind": "natural", "english": f"Alex is a good {en}.", "tamil": f"அலெக்ஸ் ஒரு நல்ல {ta}."},
        ]
    if cat == "body":
        return [
            {"kind": "simple", "english": f"This is my {en}.", "tamil": f"இது என் {ta}."},
            {"kind": "natural", "english": f"My {en} hurts.", "tamil": f"என் {ta} வலிக்கிறது."},
        ]
    if cat == "clothes":
        return [
            {"kind": "simple", "english": f"This is {art_sp}{en}.", "tamil": f"இது ஒரு {ta}."},
            {"kind": "natural", "english": f"I am wearing {art_sp}{en}.", "tamil": f"நான் {ta} அணிந்திருக்கிறேன்."},
        ]
    if cat == "colors":
        return [
            {"kind": "simple", "english": f"This color is {en}.", "tamil": f"இந்த நிறம் {ta}."},
            {"kind": "natural", "english": f"I like {en}.", "tamil": f"எனக்கு {ta} பிடிக்கும்."},
        ]
    if cat == "time":
        return [
            {"kind": "simple", "english": f"It is {en}.", "tamil": f"இது {ta}."},
            {"kind": "natural", "english": f"I like the {en}.", "tamil": f"எனக்கு {ta} பிடிக்கும்."},
        ]
    if cat == "weather":
        return [
            {"kind": "simple", "english": f"There is {en} today.", "tamil": f"இன்று {ta} இருக்கிறது."},
            {"kind": "natural", "english": f"The {en} changed this afternoon.", "tamil": f"இன்று மதியம் {ta} மாறியது."},
        ]
    if kind == "g":
        return [
            {"kind": "simple", "english": f"These are {en}.", "tamil": f"இவை {ta}."},
            {"kind": "natural", "english": f"I like {en}.", "tamil": f"எனக்கு {ta} பிடிக்கும்."},
        ]
    if kind == "u":
        return [
            {"kind": "simple", "english": f"This is {en}.", "tamil": f"இது {ta}."},
            {"kind": "natural", "english": f"I need some {en}.", "tamil": f"எனக்கு கொஞ்சம் {ta} தேவை."},
        ]
    return [
        {"kind": "simple", "english": f"This is {art_sp}{en}.", "tamil": f"இது ஒரு {ta}."},
        {"kind": "natural", "english": f"I like this {en}.", "tamil": f"எனக்கு இந்த {ta} பிடிக்கும்."},
    ]


def usage_for(row: dict) -> str:
    if row["usage"]:
        return row["usage"]
    en, kind, cat = row["en"], row["kind"], row["cat"]
    art = article(en, kind)
    art_sp = f"{art} " if art else ""
    british = row["british"]
    base = ""
    if kind == "g":
        base = f"\"{en}\" is usually plural in English. Say \"these {en}\" or \"some {en}\", not \"a {en}\"."
    elif kind == "u":
        base = (
            f"American English treats \"{en}\" as uncountable. "
            f"Say \"some {en}\" or \"{en}\", not \"a {en}\"."
        )
    elif kind == "p":
        base = (
            f"Jobs take an article in English: \"She is {art_sp}{en}.\" "
            "Tamil usually has no word for a or an, so this is easy to drop."
        )
    elif kind == "r":
        base = (
            f"Say \"my {en}\" for your own family. "
            f"\"A {en}\" means the role in general, not a specific person you love."
        )
    elif row["pos"] == "adverb":
        base = (
            f"\"{en}\" is an adverb. American English usually puts it before the main verb "
            f"(\"I {en} eat rice\") or at the end (\"She answered {en}\")."
        )
    elif kind == "a":
        base = (
            f"Put the adjective before the noun: \"a {en} room\". "
            f"After be, use it alone: \"It is {en}.\""
        )
    elif kind == "v":
        base = (
            "Use the simple present for habits (I eat every day) and "
            "am/is/are + -ing for something happening now (I am eating)."
        )
    elif cat == "dishes":
        base = (
            f"In a restaurant, \"I'll have the {en}\" is natural. "
            "Tamil speakers can keep the Tamil dish name; English speakers often know idli, dosa, and biryani."
        )
    else:
        base = (
            f"The first time you mention one {en}, use \"{art_sp}{en}\". "
            "English needs a or an here. Tamil does not."
        )
    if british:
        base += f" British English: {british}."
    if row["dutch"]:
        base += f" Dutch survival word: {row['dutch']}."
    return base


def mistake_for(row: dict) -> str:
    if row["mistake"]:
        return row["mistake"]
    en, kind = row["en"], row["kind"]
    art = article(en, kind)
    art_sp = f"{art} " if art else ""
    if kind in {"u", "g"}:
        return f"Avoid \"a {en}\". Say \"some {en}\" or just \"{en}\"."
    if kind == "v":
        return (
            "Tamil uses one present form for habits and for now. "
            "English splits them: \"I eat\" (habit) and \"I am eating\" (now)."
        )
    if row["pos"] == "adverb":
        return (
            f"Tamil word order is different. Do not drop \"{en}\" at the end of every sentence. "
            f"Try \"She answered {en}\" and listen to the stress."
        )
    if kind == "a":
        return f"Do not say \"very {en} much\". \"It is {en}\" or \"It is very {en}\" is enough."
    if kind == "p":
        return f"Say \"She is {art_sp}{en}\", not \"She is {en}\"."
    if row["cat"] == "colors":
        return f"Say \"a {en} shirt\", with the color before the noun. Not \"a shirt {en}\"."
    return (
        f"A common slip is dropping the article. Say \"I need {art_sp}{en}\", not \"I need {en}\". "
        "Also finish the final consonant; Tamil speakers sometimes soften it."
    )


def parse_line(line: str, source: str, number: int) -> dict | None:
    raw = line.strip()
    if not raw or raw.startswith("#"):
        return None
    parts = raw.split("|")
    if len(parts) < 9:
        raise SystemExit(f"{source}:{number}: expected at least 9 fields, got {len(parts)}: {raw}")
    parts = parts + [""] * (17 - len(parts))
    (
        cat, en, ta, tr, ipa, say, pos, cefr, emoji, kind,
        british, dutch, pred, s_en, s_ta, n_en, n_ta,
    ) = parts[:17]
    if cat not in {c[0] for c in CATEGORIES}:
        raise SystemExit(f"{source}:{number}: unknown category {cat}")
    if cefr not in {"A1", "A2", "B1", "B2", "C1"}:
        raise SystemExit(f"{source}:{number}: bad CEFR {cefr} for {en}")
    kind = kind or ("a" if pos == "adjective" else "v" if pos == "verb" else "c")
    row = {
        "cat": cat.strip(),
        "en": en.strip(),
        "ta": ta.strip(),
        "tr": tr.strip(),
        "ipa": ipa.strip(),
        "say": say.strip(),
        "pos": pos.strip(),
        "cefr": cefr.strip(),
        "emoji": emoji.strip(),
        "kind": kind.strip(),
        "british": british.strip(),
        "dutch": dutch.strip(),
        "pred": pred.strip(),
        "s_en": s_en.strip(),
        "s_ta": s_ta.strip(),
        "n_en": n_en.strip(),
        "n_ta": n_ta.strip(),
        "usage": "",
        "mistake": "",
    }
    if row["kind"] in {"v", "a"} and not row["s_en"] and row["kind"] == "v":
        raise SystemExit(f"{source}:{number}: verb {en} needs 4 example fields")
    if (row["s_en"] or row["n_en"]) and not (row["s_en"] and row["s_ta"] and row["n_en"] and row["n_ta"]):
        raise SystemExit(f"{source}:{number}: partial examples for {en}")
    return row


def load_rows() -> list[dict]:
    rows = []
    files = sorted(VOCAB.glob("*.txt"))
    if not files:
        raise SystemExit(f"No vocab files in {VOCAB}")
    for path in files:
        for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
            row = parse_line(line, path.name, number)
            if row:
                rows.append(row)
    return rows


def main() -> None:
    rows = load_rows()
    words = []
    seen = set()
    for row in rows:
        word_id = f"en.{row['cat']}.{slug(row['en'])}"
        if word_id in seen:
            raise SystemExit(f"Duplicate id {word_id}")
        seen.add(word_id)
        if not re.search(r"[\u0B80-\u0BFF]", row["ta"]):
            raise SystemExit(f"Tamil script missing for {word_id}: {row['ta']}")
        ipa = row["ipa"] if row["ipa"].startswith("/") else f"/{row['ipa']}/"
        words.append(
            {
                "id": word_id,
                "categoryId": row["cat"],
                "cefr": row["cefr"],
                "tamil": row["ta"],
                "transliteration": row["tr"],
                "english": row["en"],
                "ipa": ipa,
                "pronunciation": row["say"],
                "partOfSpeech": row["pos"],
                "emoji": row["emoji"] or None,
                "examples": examples_for(row),
                "usageNote": usage_for(row),
                "commonMistakes": mistake_for(row),
                "britishNote": row["british"] or None,
                "dutchNote": row["dutch"] or None,
            }
        )
    payload = {
        "version": 1,
        "sourceLanguage": "ta",
        "targetLanguage": "en",
        "variety": "American English",
        "categories": [
            {"id": cid, "nameEn": en, "nameTa": ta, "emoji": emoji, "sort": sort}
            for cid, en, ta, emoji, sort in CATEGORIES
        ],
        "words": words,
    }
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Wrote {len(words)} words to {OUT}")
    counts: dict[str, int] = {}
    for word in words:
        counts[word["categoryId"]] = counts.get(word["categoryId"], 0) + 1
    for cid, *_ in CATEGORIES:
        print(f"  {cid}: {counts.get(cid, 0)}")
    if len(words) < 1500:
        raise SystemExit(f"Seed has {len(words)} words; need at least 1500")


if __name__ == "__main__":
    main()
