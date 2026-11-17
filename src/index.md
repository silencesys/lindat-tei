---
home: true
heroImage: /hero-02.png
tagline: Guidelines for manuscript description incorporating TEI.
actionText: Quick Start →
actionLink: /guidelines/
footer: Made by Martin Roček and Ondřej Fúsik
---

## Schema

Since [version 2.0.0](./changelog/) the guidelines come with a schema. Download the files into the same folder as your XML file: the `xml-model` lines in the template point to them, and your XML editor (e.g. Oxygen) will then check the file as you write.

| File | What it checks |
| :- | :- |
| <a href="./files/ff-medieval_cuni-tei.rng" download>ff-medieval_cuni-tei.rng</a> | RELAX NG schema: which elements and attribute values are allowed |
| <a href="./files/lindat.sch" download>lindat.sch</a> | Schematron rules: IDs, pointers and the mandatory parts of the header |
| <a href="./files/lindat.odd" download>lindat.odd</a> | ODD source of the schema, for schema maintainers |
| <a href="./files/quick_start.xml" download>quick_start.xml</a> | Template to start a new file, already linked to the schema |

```xml
<?xml-model href="ff-medieval_cuni-tei.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="lindat.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
```

<div class="flex--spread">

  ![Logo Lindat](../public/lindat-logo-new-sm.png)
  ![Logo MŠMT](../public/msmt-logo.png)
  ![Logo FF UK](../public/ff-logo.png)

</div>
