# Schema and validation

The rules on these pages are also written down as a schema, so that your XML editor can check your file while you encode. A file that passes the schema follows these guidelines: it uses the right elements, the allowed attribute values, and its IDs and pointers fit together.

The schema has two parts, and a file should pass both:

| File | What it checks |
| :- | :- |
| <a href="/files/ff-medieval_cuni-tei.rng" download>ff-medieval_cuni-tei.rng</a> | **RELAX NG schema.** Which elements may appear where, which attributes are required, and which values are allowed (language codes, types, reasons…). |
| <a href="/files/ff-medieval_cuni-tei.sch" download>ff-medieval_cuni-tei.sch</a> | **Schematron rules.** Rules the RELAX NG schema cannot express: mandatory parts of the header, ID prefixes, and whether pointers such as `wit`, `hand`, `ref` and `ana` lead to an existing ID. |
| <a href="/files/ff-medieval_cuni-tei.odd" download>ff-medieval_cuni-tei.odd</a> | Source of the RELAX NG schema. Only needed by those who maintain the schema. |

## Connecting a file to the schema

Put these two lines at the top of your file, right after the XML declaration, and keep both schema files in the same folder as your XML file. The [quick start template](/files/quick_start.xml) already contains them.

```xml{2-3}
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="https://medieval-tei.humanities.tools/files/ff-medieval_cuni-tei.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="https://medieval-tei.humanities.tools/files/ff-medieval_cuni-tei.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <!-- … -->
</TEI>
```

::: warning Older files
Files started before version 2.0.0 point to `tei_all`. Replace their `xml-model` lines with the ones above, see [what to change in existing files](/changelog/#what-to-change-in-existing-files).
:::

## Validating a file

In **Oxygen XML Editor** open the file and choose *Document › Validate › Validate* (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>V</kbd>, on a Mac <kbd>⌘</kbd>+<kbd>Shift</kbd>+<kbd>V</kbd>). Oxygen reads the `xml-model` lines and checks the file against both parts of the schema; problems are listed at the bottom of the window and underlined in the text.

The Schematron rules report two kinds of problems:

+ **Errors** break a rule the guidelines call mandatory (“must”, “required”). The file is not finished until they are fixed.
+ **Warnings** point to a recommendation (“should”), for example an ID without the recommended prefix. Fix them unless you have a reason not to.

::: tip Fix from the top
One mistake often causes several messages, for example a witness without `xml:id` makes every `wit` pointing to it fail. Fix the first message and validate again.
:::

## What the schema checks

### Required attributes

| Element | Attribute | See |
| :- | :- | :- |
| `witness` | `xml:id` | [Witness description](./witness-description.md) |
| `handNote` | `xml:id` | [Hands description](./witness-description.md#hands-description) |
| `div` | `xml:lang` | [Text structure](./text-structure.md#divs) |
| `seg` | `xml:id` | [Segments](./text-structure.md#segments) |
| `add` | `place` | [Additions](./text-corrections.md#additions) |
| `supplied` | `reason` | [Supplied](./text-corrections.md#supplied) |

### Allowed values

Only the values listed on the guideline pages are accepted:

| Attribute | Allowed values |
| :- | :- |
| `xml:lang` (everywhere) | see [Language abbreviations](./language-codes.md) |
| `objectDesc/@form` | book, codex, composite_manuscript, roll, vellum, other |
| `supportDesc/@material` | parchment, paper, calfskin, goatskin, mixed |
| `person/@sex` | male, female, unknown |
| `link/@type` | wiki, brit, academia, web |
| `title/@type` | main, sub, alt, short, desc |
| `biblScope/@unit` | volume, issue, page, line, chapter, part, column, entry |
| `bibl/@type`, `biblStruct/@type` | monography, book, article, thesis, dissertation, journal, edition |
| `lb/@break` | yes, no, maybe |
| `name/@type` | person, place, org, author |
| `measure/@type` | currency, volume, height, width, weight, depth, area, time |
| `cit/@type` | ascribed, bible, example, literal, paraphrase (several can be combined) |
| `add/@place` | above, below, lmargin, rmargin, interlinear |
| `supplied/@reason` | omitted-in-original, overbinding, faded-ink, lost-folio, burnt-hole-in-original, translation |
| `gap/@reason`, `damage/@reason` | cut-out, irrelevant, cancelled, fire, faded, deletion |
| `unclear/@cert` | high, medium, low, unknown |

### Rules of the guidelines

| Area | Errors | Warnings |
| :- | :- | :- |
| [TEI Header](./tei-header.md) | `title` in `titleStmt` without `xml:lang`; `publicationStmt` without `publisher`, `pubPlace` (with `country` and `settlement`) or `date` with `when`; keyword `term` without `type` (genre, form) or `xml:lang` | two titles or keywords in the same language; `Author_`, `Editor_`, `Edition_` prefixes; edition `date` without `when` |
| [Witness description](./witness-description.md) | `msIdentifier` without `country`, `settlement`, `institution` or `idno`; `msItem/title` without `xml:lang`; `handNote` without `p` | `msIdentifier` without `collection`; `Hand_` prefix; `material` outside the list above |
| [People and places](./people-and-places.md) | `person`, `place`, `org` without `xml:id`; `placeName`, `geogName`, `orgName` in the lists without `xml:lang`; `geo` not written as two numbers separated by a space | `Person_`, `Place_`, `Org_` prefixes; `country` without `key` |
| [Bibliography](./bibliography.md) | entry without `xml:id` or `type`; `analytic` or `monogr` without `title` | ID without a prefix such as `Bibl_`; two titles with the same `type` and `level` |
| [Text structure](./text-structure.md) | `body` without a `div type="original"`; top-level `div` with a type other than original or translation; `cit` without `quote`; `notBefore` later than `notAfter` | `notBefore` without `notAfter`, `from` without `to`; `seg` not described by any `p corresp` |
| Pointers | `wit` not pointing to a witness in `listWit`; `hand` not pointing to a `handNote`; `ref`, `target`, `source` or `ana` pointing to an ID that does not exist; pointers written without `#` | |
| [Biblical citations](./text-structure.md#biblical-citations) | `cRef` without `refsDecl xml:id="biblicalCitations"` or not matching its pattern | book not abbreviated as in the [Vulgata list](./bible-short.md); `ref` without `decls="#biblicalCitations"` |
| [Translations](./translations.md) | paragraph of the original without `xml:id` when a translation exists | translated paragraph without `ana` |
| [Text corrections](./text-corrections.md) | `expan`, `corr`, `reg` outside `choice` next to `abbr`, `sic`, `orig`; `subst` without both `del` and `add` | |

## Differences from plain TEI

The LINDAT schema is a customisation of TEI P5: every file that passes it is TEI, with two exceptions that plain TEI (`tei_all`) would reject:

+ `link` may contain text and a single target, e.g. `<link target="…" type="wiki">Wikipedia</link>`. Plain TEI needs an empty `link` with at least two targets; use `<ref type="wiki" target="…">` instead, see [links](./people-and-places.md#links-to-other-resources).
+ `damage` may have a `reason` attribute. Plain TEI uses `agent` for this, see [damaged text](./text-corrections.md#marking-damaged-part).

The schema also narrows TEI: it uses only the TEI modules these guidelines need, and allows only the values listed above where TEI would accept any value.

## For schema maintainers

The RELAX NG schema is generated from `ff-medieval_cuni-tei.odd`; edit the ODD, never the `.rng` file directly. After changing the ODD, generate the schema again in one of these ways and save it as `src/public/files/ff-medieval_cuni-tei.rng`:

+ [Roma](https://roma.tei-c.org): *Customize* › upload `ff-medieval_cuni-tei.odd` › *Download* › *RELAX NG schema*.
+ Oxygen: open `ff-medieval_cuni-tei.odd` › *Configure Transformation Scenario* › *TEI ODD to RELAX NG XML*.
+ [TEI Stylesheets](https://github.com/TEIC/Stylesheets): `bin/teitorelaxng ff-medieval_cuni-tei.odd ff-medieval_cuni-tei.rng`.

The Schematron rules in `ff-medieval_cuni-tei.sch` are edited directly. Then validate the [examples](/examples/) and the [quick start template](/files/quick_start.xml) again, and record the change in the [changelog](/changelog/).
