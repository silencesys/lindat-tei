# Changelog

All notable changes to these guidelines, the schema and the templates.

## 2.0.0 <Badge text="17 November 2026"/>

The guidelines now come with a schema, and the rules on the pages were corrected to match it. **Files encoded under version 1 will not pass the schema until they are updated**, see [What to change in existing files](#what-to-change-in-existing-files).

### Added
- Schema, downloadable from the [guidelines introduction](../guidelines/#schema):
  - `ff-medieval_cuni-tei.rng`: RELAX NG schema (elements and allowed attribute values)
  - `ff-medieval_cuni-tei.sch`: Schematron rules (IDs, pointers, mandatory parts of the header)
  - `ff-medieval_cuni-tei.odd`: ODD source of the schema
- New [quick start template](/files/quick_start.xml) that validates against the schema.
- New guidelines page [Schema and validation](../guidelines/schema.md): how to connect and validate a file, what the schema checks, and how it differs from plain TEI.
- Notes where the LINDAT schema differs from plain TEI: `link` with text and one target ([People and places](../guidelines/people-and-places.md#links-to-other-resources)) and `damage` with `reason` ([Text corrections](../guidelines/text-corrections.md#marking-damaged-part)).
- Allowed values that the examples already used: `book` for bibliography types, `other` for `objectDesc/@form`, `burnt-hole-in-original` and `translation` for `supplied/@reason`, `deletion` for `gap/@reason`.

### Changed
- **Language codes** now follow BCP 47, as TEI requires: `cs`, `cs-x-middle`, `cs-x-old`, `en`, `fr`, `de`, `el`, `la` replace `cze`, `czm`, `czo`, `eng`, `fre`, `ger`, `gre`, `lat`. `enm`, `ang`, `frm`, `fro`, `gmh`, `goh`, `grc` stay. See [Language abbreviations](../guidelines/language-codes.md).
- **Pointers** always start with `#`: `wit="#Witness_A"`, `ana="#p3"`, `hand="#Hand_Unknown-1"`.
- **Certainty of `unclear`** uses TEI's values: `high`, `medium`, `low`, `unknown` (was high, middle, low, uncertain).
- **`measure`** uses `unit` (was `units`, which is not a TEI attribute).
- **`biblScope`** uses `unit="page"` (was `type="pages"`).
- **`xml-model` lines** point to `ff-medieval_cuni-tei.rng` and `ff-medieval_cuni-tei.sch` instead of `tei_all`.
- The site is built with VitePress instead of VuePress 1, which is no longer maintained. Page addresses stay the same; the site now has full-text search.

### Fixed
- General TEI structure: `body` sits inside `text`.
- TEI Header: `encodingDesc` moved out of `fileDesc` in the skeleton; bibliography entry uses `Bibl_RE_TAC` and `type="book"`.
- Witness description: `acquisition` was misspelled; curly quotes in attribute values replaced by straight ones.
- People and places: `geo` coordinates separated by a space only; `settlement` instead of `city`; the Country section described `region`; the meaning of `notBefore`/`notAfter` on `age` explained.
- Bibliography: `Bibl_` prefix used in all examples.
- Text structure: `<bibl></bible>`; cit type `biblie` → `bible`; `placeName`/`orgName` point to `Place_`/`Org_` IDs; one spelling of `BernEpist`; two broken links.
- Text corrections: `<ex>us</ex>`; curly quotes in the `unclear` example; typos (overbinding, extent).
- Examples: Somniale Danielis and Regula sancti Benedicti now validate against the schema (pointers, language codes, hand notes, witness IDs, publication statement, dates).

### What to change in existing files
1. Replace the two `xml-model` lines with the ones from the [quick start template](/files/quick_start.xml) and put the schema files next to your XML file.
2. Convert the language codes in every `xml:lang` (`lat` → `la`, `cze` → `cs`, `eng` → `en`, `czo` → `cs-x-old`, …).
3. Add `#` to every `wit`, `ana` and `hand` value that lacks it.
4. Give every `witness` an `xml:id`, and every `handDesc` a `handNote` with an `xml:id` if you use `hand`.
5. Change `cert="middle"` to `medium`, `cert="uncertain"` to `unknown`, `units=` to `unit=`, `biblScope type="pages"` to `unit="page"`.
6. Validate the file and fix what the schema reports.

## 1.0.0 <Badge text="1 October 2020"/>

Initial public release.

### Added
- Guidelines: Introduction, General TEI structure, TEI Header, Witness description, People and places, Bibliography, Text structure, Text corrections, Translations.
- Abbreviations: language codes and biblical abbreviations.
- Quick start template (`quick_start.xml`).

Between 2020 and 2024 the site was extended without new version numbers: the Somniale Danielis and Regula sancti Benedicti examples, the editorial style guide (in Czech), footnotes, links to the lists of people, places and witnesses, and smaller fixes.
