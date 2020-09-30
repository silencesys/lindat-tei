# TEI Header
The TEI header `<teiHeader>` is mandatory and contains descriptive meta-information about the document. The `<teiHeader>` minimally contains a description of the electronic file inside a `<fileDesc>`. The latter element consists of three mandatory components:

+ the title statement `<titleStmt>`, providing information about the title `<title>`, author `<author>`, and others responsible for the electronic text `<editor>`
+ the edition statement `<editionStmt>`, providing information about the `<title>`, author `<author>`, and other bibliographical information of previous editions of the text
+ the publication statement `<publicationStmt>`, providing publication details about the electronic text in a structured way or as prose inside a paragraph `<p>`
+ a description of the source `<sourceDesc>`, documenting bibliographic details about the electronic text’s material source (if any) in a structured way or in a prose paragraph `<p>`

```xml
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <!-- Title statement -->
      </titleStmt>
      <editionStmt>
        <!-- Edition statement -->
      </editionStmt>
      <publicationStmt>
        <!-- Publication statement -->
      </publicationStmt>
      <sourceDesc>
        <!-- Source description -->
      </sourceDesc>
    </fileDesc>
  </teiHeader>
```

## Title statement
The title statement `<titleStmt>` is a mandatory element and contains meta-information as title, author and editor of the
document.

#### Title
```xml
<title xml:lang="lat">Somniale Danielis</title>
```
The element should always contain title of the document and has set `xml:lang` attribute with ISO-639-3 language code.
For list of language codes see [language codes](./language-codes.md). The `<title>` tag can be repeated as many times
as needed, but the `xml:lang` should be always set to different language.

#### Author
```xml
<author xml:id="AKT">Kříž z Telče</author>
<!-- In case the author is unknown, following option is also acceptable -->
<author xml:id="AU">Unknown</author>
```
The element should containt name of the author in following format `name surname`. In case author does not have surname as we
know it nowadays name should be first. To link to the author later in text `xml:id` attribute can be used. It is recommended to prefix
name of the author with letter `A`, see example above.

#### Editor
```xml
<editor xml:id="EdMR">Martin Roček</editor>
```
The element contains name of the editor in format `name surname`. Similarly as in case of authors `xml:id` can be used
to link to the editor later in text. It is also recommended to prefix name of the editor with letter `Ed`.

Valid `titleStmt` should look like the following snippet.
```xml
<titleStmt>
  <title xml:lang="lat">Somniale Danielis</title>
  <title xml:lang="eng">Dreambook of Daniel</title>
  <author>Unknown</author>
  <editor>Martin Roček</editor>
</titleStmt>
```

## Edition statement
The title statement `<editionStmt>` is a mandatory element and contains meta-information about already existing editions
of the document.

#### Edition
```xml
<edition xml:id="E1S">
  <title xml:lang="eng"></title>
</edition>
```
Every edition should be inside the `<edition>` element. `xml:id` attribute can be used to link to particular edition
in text, it is recommended to prefix edition with `E` letter.

#### Title
```xml
<title xml:lang="eng">Somniale Danielis: the medieval dreambook</title>
```
Similarly like in the `<titleStmt>` this element should contain title of the edition with set `xml:lang` attribute. See
table of the [language codes](./language-codes.md) for valid language abbreviations.

#### Date
```xml
<date when="YYYY-MM-DD">Day Month Year</date>
```
Element should contain date when the edition was published in human readable form. Attribute `when` should on the other
hand always contain date in machine readable form `YYYY-MM-DD` where `YYYY` stands for year, `MM` for month and `DD` for day.
In case only year is known, date should not be omnited but `01` should be used instead.

#### Note
```xml
<note>Note of the editor</note>
```
Should contain editor's note and description of differences between editions.


Valid `editionStmt` should look like:
```xml
<editionStmt>
  <edition>
    <title xml:lang="eng">Somniale Danielis: the Medieval Dreambook</title>
    <date when="1981-01-01">1981</date>
    <note>Edition describes two oldest fragments of the Somniale Danielis</note>
  </edition>
</editionStmt>
```

## Publication statement
The publicationStmt element is the thirdth component of the fileDesc element and is mandatory. Its function is to name the agency by which a resource is made available (for example, a publisher or distributor) and to supply any additional information about the way in which it is made available such as licensing conditions, identifying numbers, etc.

#### Published
```xml
<publisher>Faculty of Arts</publisher>
```
Provides the name of the organization responsible for the publication or distribution of a bibliographic item.

#### Publication place
```xml
<pubPlace>
  <country>Czech Republic</country>
  <region><!-- Can be set for countries which are divided to regions --></region>
  <settlement>Prague</settlement>
</pubPlace>
```
Contains the name of the place where a bibliographic item was published and is additionaly structured with `<country>`, `<region>` and `<settlement>` elements.

+ `<country>` element should always contain english name of the country where item was published
+ `<region>` element is optional and can be used to specify region where item was published
+ `<settlement>` element should contain name of the city where item was published

#### Date
Same as [before](#date), date should contain information when item was published.

Valid publication statement should look like
```xml
<publicationStmt>
  <publisher>Faculty of Arts</publisher>
  <pubPlace>
    <country>Czech Republic</country>
    <region><!-- Can be set for countries which are divided to regions --></region>
    <settlement>Prague</settlement>
  </pubPlace>
  <date when="2020-09-30">2020</date>
</publicationStmt>
```

## Source description
```xml
<sourceDesc>
  <p>General description</p>
  <listWit>
    <witness xml:id="A17"></witness>
  </listWit>
</sourceDesc>
```
The `sourceDesc` element is the fourth and final component of the fileDesc element. It is a mandatory element and is used to record details of the source or sources from which a computer file is derived. This might be a printed text or manuscript, another computer file, an audio or video recording of some kind, or a combination of these. An electronic file may also have no source, if what is being catalogued is an original text created in electronic form. The paragraph `<p>` element can and should be used for general description of the sources, then each witness should be listed in the `listWit` list.



