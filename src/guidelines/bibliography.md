# Bibliography

To include bibliographic citations in the document a `listBibl` can be used. It should be located inside the `sourceDesc` element inside the `teiHeader`.

::: danger Important
All bibliographic citations should follow Chicago Manual of Style. For more details, see [Chicago manual of style](https://www.chicagomanualofstyle.org/tools_citationguide/citation-guide-1.html).
:::

```xml
<listBibl>
  <head>Select bibliography</head>
  <bibl xml:id="Bib_RE_TAC" n="1">Richard Ellmann (ed), The Artist as Critic: Critical Writings of Oscar Wilde (Chicago 1982).</bibl>
  <!-- or -->
  <biblStruct>
    <analytic>
      <author>Oscar Wilde</author>
      <title level="a">The Importance of Being Earnest</title>
    </analytic>
    <monogr>
      <title level="m">Plays, Prose Writings and Poems</title>
      <imprint>
        <pubPlace>London</pubPlace>
        <publisher>Everyman</publisher>
        <date>1930</date>
        <biblScope type="pages">450-509</biblScope>
      </imprint>
    </monogr>
  </biblStruct>
</listBibl>
```

::: details See the full source description
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

## Simple citation
```xml
<bibl xml:id="Bibl_RE_TAC" n="1" type="book">Richard Ellmann (ed), The Artist as Critic: Critical Writings of Oscar Wilde (Chicago 1982).</bibl>
```
The `bibl` element should be used if simple textual descriptions of bibliography are enough. The `xml:id` attribute should contain a unique ID. It is recommended to prefix the id with `Bibl_` prefix to avoid potential collision of IDs in the document. The attribute `n` can be used to number the record inside the list and it is not necessary unique within the document.

## Structured bibliographic citation
```xml
<biblStruct xml:id="Bibl_OW_IBE" n="1" type="book">
  <analytic>
    <author>Oscar Wilde</author>
    <title level="a">The Importance of Being Earnest</title>
  </analytic>
  <monogr>
    <title level="m">Plays, Prose Writings and Poems</title>
    <imprint>
      <pubPlace>London</pubPlace>
      <publisher>Everyman</publisher>
      <date>1930</date>
      <biblScope unit="page">450-509</biblScope>
    </imprint>
  </monogr>
</biblStruct>
```
The `biblStruct` element should be used for structured descriptions of bibliographic information. Likewise the `bibl` element it should be used `xml:id` to provide a unique identificator of the record and `n` attribute to number the record inside the list.

Both `bibl` and `biblStruct` element should have set `type` attribute specifying the type of the bibliographic record. See table below for available types: `monography`, `article`, `thesis`, `dissertation`, `journal`, `edition`.

::: tip
The ID of the `bibl` and `biblStruct` elements should have different prefixes for different lists.
:::

### Analytic level of description
```xml
<analytic>
  <author>Oscar Wilde</author>
  <title level="a">The Importance of Being Earnest</title>
</analytic>
```
This section should contain bibliographic elements describing an item (e.g. an article or poem) published within a monograph or journal and not as an independent publication. The analytic level should be usually followed by monographic level.

### Monographic level
```xml
<monogr>
  <title level="m">Plays, Prose Writings and Poems</title>
  <imprint>
    <pubPlace>London</pubPlace>
    <publisher>Everyman</publisher>
    <date>1930</date>
    <biblScope unit="page">450-509</biblScope>
  </imprint>
</monogr>
```
These element should describe an item (e.g. a book or journal) published as an independent item (i.e. as a separate physical object). Monographic level may also contain `author` tag if the bibliographic record is monography.

### Author
```xml
<author>Oscar Wilde</author>
```
Contains the name(s) of an author, personal or corporate, of a work; for example in the same form as that provided by a recognized bibliographic name authority. The element can be repeated as many times as needed.

::: tip
The `author` element can contain element `persName` and be linked to a predefined person in the `sourceDesc`.
:::

### Title
```xml
<title xml:lang="eng" level="m" type="main">Plays, Prose Writings and Poems</title>
```
The `title` element is mandatory and must be present in both `analytic` and `monogr`. It should contain the title of the bibligoraphic record and different level should be noted in the `level` attribute. The attribute `type` should further specify the type of the title. For example, books usually have main title and subtitle. It is also recommended to keep information about the language of the title.

| Level | Description
| :- | :-
| a | (analytic) the title applies to an analytic item, such as an article, poem, or other work published as part of a larger item.
| m | (monographic) the title applies to a monograph such as a book or other item considered to be a distinct publication, including single volumes of multi-volume works
| j | (journal) the title applies to any serial or periodical publication such as a journal, magazine, or newspaper
| s | (series) the title applies to a series of otherwise distinct publications such as a collection
| u | (unpublished) the title applies to any unpublished material (including theses and dissertations unless published by a commercial press)

| Type | Description
| :- | :-
| main | main title
| sub | (subordinate) subtitle, title of part
| alt | (alternate) alternate title, often in another language, by which the work is also known
| short | abbreviated form of title
| desc | (descriptive) descriptive paraphrase of the work functioning as a title

::: tip More than one title element
There can be more than one title element if the `type` attribute is different.
```xml
<title xml:lang="eng" level="m" type="main">Dreams and Visions in the Early Middle Ages</title>
<title xml:lang="eng" level="m" type="sub">The Reception and Use of Patristic Ideas, 400–900</title>
```
:::

### Imprint
```xml
<imprint>
  <pubPlace>London</pubPlace>
  <publisher>Everyman</publisher>
  <date when="1930">1930</date>
  <biblScope unit="page">450-509</biblScope>
</imprint>
```
Groups information relating to the publication or distribution of a bibliographic item.

#### Publication place
```xml
<pubPlace>London</pubPlace>
```
Contains the name of the place where a bibliographic item was published.

#### Publisher
```xml
<publisher>Everyman</publisher>
```
The `publisher` element provides the name of the organization responsible for the publication or distribution of a bibliographic item.

#### Date
```xml
<date when="1930">1930</date>
```
The `date` element contains date in any format, see [date](./tei-header.md#date) for further description.

#### Scope of bibliographic reference
```xml
<biblScope unit="page">450-509</biblScope>
```
The element defines the scope of a bibliographic reference, for example as a list of page numbers, or a named subdivision of a larger work. The attribute `unit` describes additional sub-type of the bibliographical reference.

| Units | Description
| :- | :-
| volume | the element contains a volume number.
| issue | the element contains an issue number, or volume and issue numbers.
| page | the element contains a page number or page range.
| line | the element contains a line number or line range.
| chapter | the element contains a chapter indication (number and/or title)
| part | the element identifies a part of a book or collection.
| column | the element identifies a column.
| entry | the element identifies an entry number or label in a list of entries.

## Different bibliographic lists
```xml{2}
<listBibl>
  <head>Select bibliography</head>
  <!-- List of bibliographic items -->
</listBibl>
```
The `listBibl` element can be repeated as many times as needed. Thus it can be used to create different kind of lists, for example one list can contain only _Select bibliography_ and the other _The editions used in the digital editions_. Each of these list can contain different degree of detail, one can use simple `bibl` elements and the other `biblStruct`. It is strongly advised to use `header` element to name these lists for easier orientation, see highlighted row in example.

::: tip
It might be useful to use different ID prefixes for different lists.
:::