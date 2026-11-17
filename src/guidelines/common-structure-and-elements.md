# General TEI structure
The TEI makes use of XML as its governing metalanguage. This means that all TEI metadata are expressed as XML elements and thus comply with the World Wide Web Consortium XML Recommendation. Information (plain text) is contained in XML elements, delimited by start tags (e.g., `<TEI>`) and end tags (e.g., `</TEI>`). Additional information to these XML elements can be given in attributes, consisting of a name (e.g., `xml:id`) and a value (e.g., "text1"). XML comments are delimited by start markers (`<!--`) and end markers (`-->`).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="ff-medieval_cuni-tei.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="lindat.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
  <!-- Information that describes the document -->
  </teiHeader>
  <text>
    <body>
    <!-- Content of the document -->
    </body>
  </text>
</TEI>
```

The element `teiHeader` contains all the metadata describing the document, the `text` element and its `body` contain the actual document. **The forementioned structure is mandatory for all _standard_ TEI documents.**

::: tip Schema
The two `xml-model` lines connect the file to the LINDAT schema: the RELAX NG schema `ff-medieval_cuni-tei.rng` checks which elements and attribute values are allowed, the Schematron rules in `lindat.sch` check the rules of these guidelines (IDs, pointers, mandatory parts). Keep both files in the same folder as your XML file. Both can be downloaded from the [home page](/#schema).
:::