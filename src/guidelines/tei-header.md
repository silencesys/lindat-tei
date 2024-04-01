# TEI Header
The TEI header `<teiHeader>` is mandatory and contains descriptive meta-information about the document. The `<teiHeader>` minimally contains a description of the electronic file inside a `<fileDesc>`. Further, the TEI header may contain `<encodingDesc>`, outlining the connection between the electronic text and the originating source or sources, and `<profileDesc>`, assigning keywords to each file.

The `<fileDesc>` element consists of four components:

+ the title statement `<titleStmt>` (mandatory), providing information about the title `<title>`, author `<author>`, and others responsible for the electronic text `<editor>`
+ the edition statement `<editionStmt>` (mandatory/optional), providing information about the `<title>`, author `<author>`, and other bibliographical information of the previous editions of the text
+ the publication statement `<publicationStmt>` (mandatory), providing publication details about the electronic text in a structured way or as prose inside a paragraph `<p>`
+ a description of the source `<sourceDesc>` (mandatory), documenting bibliographic details about the electronic text’s material source (if any) in a structured way or in a prose paragraph `<p>`

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
	  <encodingDesc>
        <!-- Encoding description -->
      </encodingDesc>
      <sourceDesc>
        <!-- Source description -->
      </sourceDesc>
    </fileDesc>
  </teiHeader>
  <!-- Body, see TEI Body chapter -->
</TEI>
```

## Title statement
The title statement `<titleStmt>` is a mandatory element and contains meta-information as title, author and editor of the
document.

#### Title
```xml
<title xml:lang="lat">Somniale Danielis</title>
```
The element should always contain title of the document and have set `xml:lang` attribute with ISO-639-3 language code.
Name of the document can be anything, but it is strongly advised to keep the name of the source text.
For a list of language codes see [language codes](./language-codes.md). The `<title>` tag can be repeated as many times
as needed, but the `xml:lang` should be always set to a different language.

#### Author
```xml
<author xml:id="Author_MartinRocek">Martin Roček</author>
```
The element should contain the name of the author of the digital text in the following format `name surname`.
To link to the author later in text the `xml:id` attribute can be used. It is recommended to prefix
the name of the author with string `Author_`, see example above.
Alternatively, sometimes it might be desired to keep the name of the author of the original text. In that case `author` element should contain name of the author and your name should be inside the responsibility statement `respStmt` with description of your responsibilities.

#### Statement of responsibility
It supplies a statement of responsibility for the intellectual content of a text, edition, recording, or series, where the specialized elements for authors, editors, etc. do not suffice or do not apply. May also be used to encode information about individuals or organizations which have played a role in the production or distribution of a bibliographic work. Name of the person should always be wrapped in the `name` element and description of responsibility in the `resp` element. The description of the particular responsibilities in the `resp` element is to be unified across all files of the database. It is advised to use the `type="author"` attribute to denote a person.
::: details Show example
```xml
<titleStmt>
	<title xml:lang="lat">[Colophon]: Qui me scribebat, nomen...</title>
	<title xml:lang="cze">Kolofón: Ten, který mě napsal, měl jméno...</title>
	<title xml:lang="eng">Colophon: The one who wrote me was...</title>
	<author xml:id="Author_Unknown">
	   <name xml:lang="eng">Unknown</name>
	   <name xml:lang="cze">Neznámý</name>
	   <name xml:lang="lat">Ignotus</name>
	</author>
	<respStmt>
	   <resp>Transcribed and encoded by</resp>
	   <name type="author">Berenika Bendová</name>
	</respStmt>
	<respStmt>
	   <resp>XML edited by</resp>
	   <name type="author">Karel Pacovský</name>
	</respStmt>
	<respStmt>
	   <resp>XML edited by</resp>
	   <name type="author">Pavel Tříska</name>
	</respStmt>
</titleStmt>
```
:::

#### Editor
```xml
<editor xml:id="Editor_MartinRocek">Martin Roček</editor>
```
The element contains name of the editor of the digital text in format `name surname`. Similarly, as in case of authors, `xml:id` can be used
to link to the editor later in text. It is also recommended to prefix name of the editor with string `Editor_`. Can be omitted if there are
no editors.

::: details See valid title statement
```xml
<titleStmt>
  <title xml:lang="lat">Somniale Danielis</title>
  <title xml:lang="eng">Dreambook of Daniel</title>
  <author>Martin Roček</author>
</titleStmt>
```
:::

## Edition statement
The edition statement provides detailed information about the edition of the electronic text (if applicable). Similar to editions of printed texts, electronic texts may be substantially revised in different versions. Somehow closer to the world of software programs, an edition of an electronic text can be compared to the “release” of a piece of software. For an electronic text, the alteration of its contents, or addition/expansion/removal of substantive (types of) meta-information could qualify a new version of an electronic text as a new edition.

::: tip Information
An edition statement is optional for the first release of a computer file; it is mandatory for each later release, though this requirement cannot be enforced by the parser.
:::

#### Edition
```xml
<edition xml:id="Edition_1S" n="1.0">
  <title xml:lang="eng"></title>
</edition>
```
Every edition should be inside the `<edition>` element. `xml:id` attribute can be used to link to a particular edition
in text, it is recommended to prefix edition with `Edition_` string. The `n` attribute can be used to inform about version of the digital text.

#### Title
```xml
<title xml:lang="eng">Somniale Danielis: the medieval dreambook with thematic annotations</title>
```
Likewise in the `<titleStmt>`, this element should contain title of the edition with set `xml:lang` attribute. See
table of the [language codes](./language-codes.md) for valid language abbreviations.

#### Date
```xml
<date when="YYYY-MM-DD">2020</date>
```
Element should contain date when the edition was published in a human readable form. Attribute `when` should on the other
hand always contain date in machine readable form `YYYY-MM-DD` where `YYYY` stands for year, `MM` for month and `DD` for day.
In case only year is known, date can be omitted.

#### Statement of responsibility
```xml
<respStmt>
  <name>Martin Roček</name>
  <resp>Added thematic annotations.</resp>
</respStmt>
```
The `respStmt` attribute contains descriptions of responsibilities specific to the current edition. It supplies a statement of responsibility for the intellectual content of a text, edition, recording, or series, where the specialized elements for authors, editors, etc. do not suffice or do not apply. May also be used to encode information about individuals or organizations which have played a role in the production or distribution of a bibliographic work. Name of the person should be always wrapped in the `name` element and description of responsibility in the `resp` element.

#### Note
```xml
<note>Note of the editor</note>
```
Should contain editor's note and description of differences between editions.


::: details See valid edition statement
If, for example, the digital edition of this version of Somniale Danielis builds on an existing electronic edition, but adds a substantive new category of annotations by Martin Roček, this could be reflected in the `editionStmt` as follows:
```xml
<editionStmt>
  <edition xml:id="Edition_2.0" n="2.0">
    <title xml:lang="eng">Somniale Danielis: the Medieval Dreambook with thematic annotations</title>
    <date when="2020-09-30">2020</date>
    <note>Thematic annotations were added to the two oldest fragments of the Somniale Danielis.</note>
  </edition>
  <respStmt>
    <name>Martin Roček</name>
    <resp>Added thematic annotations.</resp>
  </respStmt>
</editionStmt>
```
:::

## Publication statement
The publicationStmt element is the third component of the fileDesc element and is mandatory. Its function is to name the agency by which a resource is made available (for example, a publisher or distributor) and to supply any additional information about the way in which it is made available such as licensing conditions, identifying numbers, etc.

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
Contains the name of the place where the bibliographic item was published and is additionaly structured with `<country>`, `<region>` and `<settlement>` elements.

+ `<country>` element should always contain English name of the country where item was published
+ `<region>` element is optional and can be used to specify region where item was published
+ `<settlement>` element should contain name of the city where item was published

#### Date
Same as [before](#date), date should contain information when the item was published.

#### Availability
```xml
<availability>
  <p>This is an open access work licensed under a Creative Commons Attribution 4.0 International license.</p>
</availability>
```
In case the license needs to be mentioned inside the document, the `availability` statement can be used. The license should be described inside a paragraph.

::: details See valid publication statement
```xml
<publicationStmt>
  <publisher>Faculty of Arts</publisher>
  <pubPlace>
    <country>Czech Republic</country>
    <region><!-- Can be set for countries which are divided to regions --></region>
    <settlement>Prague</settlement>
  </pubPlace>
  <date when="2020-09-30">30. září 2020</date>
  <availability>
    <p>This is an open access work licensed under a Creative Commons Attribution 4.0 International license.</p>
  </availability>
</publicationStmt>
```
:::

## Source description
```xml
<sourceDesc>
  <listWit>
    <witness xml:id="A17"></witness>
  </listWit>
  <!-- can contain various lists see People and places or Bibliography -->
</sourceDesc>
```
The `sourceDesc` element is the fourth and final component of the fileDesc element. It is a mandatory element and is used to record details of the source or sources from which a computer file is derived. This might be a printed text or a manuscript, another computer file, an audio or video recording of some kind, or a combination of these. An electronic file may also have no source, if what is being catalogued is an original text created in an electronic form. The paragraph `<p>` element can and should be used for the general description of the sources, then each witness should be listed in the `listWit` list.

::: details See valid source description
This source description contains additional lists which are described in full on following pages.
```xml
<sourceDesc>
  <listWit>
    <witness xml:id="A17"></witness>
  </listWit>
  <listPerson>
    <person xml:id="C4"></person>
  </listPerson>
  <listPlace>
    <place xml:id="rome"></place>
  </listPlace>
  <listOrg>
    <org xml:id="catholic-church"></org>
  </listOrg>
  <listBibl>
    <bibl xml:id="Bib_RE_TAC" n="1"></bibl>
  </listBibl>
</sourceDesc>
```
:::

## Encoding description
```xml
<encodingDesc>
  <projectDesc>
    <p><!-- General project description, optional --></p>
  </projectDesc>
  <refsDecl></refsDecl>
</encodingDesc>
```
Documents the relationship between an electronic text and the source or sources from which it was derived. It can be
used to further describe principles that were used when the text was encoded. The text can be written in prose in
paragraphs `p` or sub-components.

# Profile description
```xml
<profileDesc>
	<textClass>
		<keywords>
			<term type="genre" xml:lang="eng">Riddles</term>
			<term type="genre" xml:lang="cze">Hádanky</term>
			<term type="genre" xml:lang="lat">Aenigmata</term>
			<term type="form" xml:lang="eng">Unclear</term>
			<term type="form" xml:lang="cze">Nejasné</term>
		</keywords>
	</textClass>
</profileDesc>
```
Assigns a category of genre (type="genre") and form (type="form") within the `keywords` element. The `<term>` tag can be repeated for individual language variants (i.e. `xml:lang` should be always set to a different language for each type).
