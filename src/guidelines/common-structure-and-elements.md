# General TEI structure
The TEI makes use of XML as its governing metalanguage. This means that all TEI metadata are expressed as XML elements and thus comply with the World Wide Web Consortium XML Recommendation. Information (plain text) is contained in XML elements, delimited by start tags (e.g., `<TEI>`) and end tags (e.g., `</TEI>`). Additional information to these XML elements can be given in attributes, consisting of a name (e.g., `xml:id`) and a value (e.g., "text1"). XML comments are delimited by start markers (`<!--`) and end markers (`-->`).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
  <!-- Information that describes the document -->
  </teiHeader>
  <body>
  <!-- Content of the document -->
  </body>
</TEI>
```

The element `teiHeader` contains all the metadata describing the document, `body` element contains the actual document. **The forementioned structure is mandatory for all _standard_ TEI documents.**