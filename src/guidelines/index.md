# Introduction

This websites provides guidlines to help with manuscript encoding for the LINDAT/CLARIAH project. The following pages discuss all important elements and best practices. In case you have further questions, do not hesitate and contact one of us: Lucie Doležalová, Martin Roček, Ondřej Fúsik. We will be happy to help you.

Most of the descriptions are taken from the official TEI5P guidelines. Because of that it might not be the most descriptive ones. For that reason, please, inform us if you will have any suggestions how to improve these descriptions. Parts of this website are also build on the examples and descriptions from presentations that were given by [Marjorie Burghard](https://www.digitalmanuscripts.eu/people/co-ordinators/marjorie-burghart/) and were available online.

## Important sources
+ [**Text Encoding Initiative**](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/index.html), an official TEI website, where are all rules described in detail
+ [**TEI by Example**](http://teibyexample.org/TBE.htm), tons of tutorials and examples of TEI uses
+ [**Latin**](https://latin.rocek.dev), latin to english dictionary and grammatical analyser
+ [**Course**](https://teach.dariah.eu/course/view.php?id=32&section=0), a course on TEI encoding by Marjorie Burghart and Elena Pierazzo

## Quick start

The following template can be used to quickly start with your encoding. This snippet contains all necessary items in the `teiHeader` and it is up to you to fill them with information you want! The template is already linked to the schema, see below.

:floppy_disk: <a href="/files/quick_start.xml" download>Download the file</a>

## Schema

Since [version 2.0.0](/changelog/) the guidelines come with a schema that checks your file against the rules on these pages. Download both schema files into the same folder as your XML file: the `xml-model` lines at the top of the template point to them, and your XML editor (e.g. Oxygen) will then check the file as you write.

| File | What it checks |
| :- | :- |
| <a href="/files/ff-medieval_cuni-tei.rng" download>ff-medieval_cuni-tei.rng</a> | RELAX NG schema: which elements and attribute values are allowed |
| <a href="/files/ff-medieval_cuni-tei.sch" download>ff-medieval_cuni-tei.sch</a> | Schematron rules: IDs, pointers and the mandatory parts of the header |
| <a href="/files/ff-medieval_cuni-tei.odd" download>ff-medieval_cuni-tei.odd</a> | ODD source of the schema, only for schema maintainers |

```xml
<?xml-model href="ff-medieval_cuni-tei.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="ff-medieval_cuni-tei.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

What the schema checks, how to validate a file and how the schema differs from plain TEI is described in [Schema and validation](./schema.md).
