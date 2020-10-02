# Text structure
If the `<teiHeader>` element contained the meta-information about the document, then `<text>` element contains the document itself.
Text element is mandatory and consist of any of these three elements.

+ the front matter `<front>` contains any prefatory matter (headers, abstracts, title page, prefaces, dedications, etc.) found at the beginning of the document, before the main body.
+ the text body `<body>` contains the whole body of a single unitary text, excluding any front or back matter.
+ the back matter `<back>` contains any appendixes, etc. following the main part of a text.

::: tip
For front matter and back matter I would recommend visiting [TEI guidelines](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSTITL) as for mediaeval manuscripts `<body>` element is often the only element needed.
:::

```xml
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <!-- Tei Header, see TEI Header chapter -->
  <text>
    <front>
      <!-- contains any prefatory matter -->
    </front>
    <body>
      <!-- contains the textual body of the document -->
    </body>
    <back>
      <!-- contains any appendixes -->
    </back>
  </text>
</TEI>
```

## Structural elements
There are two primary elements that should be used to structure and divide text.

#### Divs
```xml
<div xml:id="div1" xml:lang="lat" hand="#S1unknown"></div>
```
`Div`s should be used to divide text to bigger chunks like chapters or whatever works for your text. They can be also freely nested.
Attributes like `xml:id` and `hand` are optional. `xml:id` can be later used to link text division with translation, `hand` can be
used to refer to the scribe that was defined in `<teiHeader>` section. Attribute `xml:lang` should be always present and must
contain valid language code, see [the table](./language-codes.md).

#### Paragraphs
```xml
<p xml:id="p13" xml:lang="lat" hand="#S1unknown"></p>
```
Paragraph tag should be used to divide text into paragraphs. Unlike the divs the attribute `xml:id` is mandatory for paragraphs if you consider
providing translation of the text. The `xml:id` attribute will be used to identify paragraphs across different language variants. The `xml:lang`
attribute should contain valid language code, [see the table](./language-codes.md). The `hand` attribute is again optional and can be used to point
to a scriber that was defined in `<teiHeader>` section.

#### Page beginnings
```xml
<pb source="#E1S" n="f23v" facs="image.jpg" />
```
A pb element should appear at the start of the page which it identifies. The global `n` attribute indicates the number or other value associated with this page. This will normally be the page number or signature printed on it, since the physical sequence number is implicit in the presence of the pb element itself.  The `source` attribute should contain ID of the edition or source to which is the page beginning referring. The `facs` attribute can refer to the linked image file containing the folio.

#### Line beginnings
```xml
<lb source="#E1S" n="1" break="no" />
```
By convention, `lb` elements should appear at the point in the text where a new line starts. The `n` attribute, if used, indicates the number or other value associated with the text between this point and the next lb element, typically the sequence number of the line within the page, or another appropriate unit. This element is intended to be used for marking actual line breaks on a manuscript or printed page, at the point where they occur; it should not be used to tag structural units such as lines of verse (for which the l element is available) except in circumstances where structural units cannot otherwise be marked. The `break` attribute indicate whether or not the element concerned is considered to mark the end of an orthographic token in the same way as whitespace.

| break | description
| :- | :-
| yes | the element bearing this attribute is considered to mark the end of any adjacent orthographic token irrespective of the presence of any adjacent whitespace
| no | the element bearing this attribute is considered not to mark the end of any adjacent orthographic token irrespective of the presence of any adjacent whitespace
| maybe | the encoding does not take any position on this issue.

## Names
Almost every text contains names, whether they are the names of people, places or organizations. These names should be encoded and for that purpose a variety of elements can be used.

### Universal name element
```xml
<name type="place" ref="#Place_Prague">Prague</name>
```
Contains a proper noun or noun phrase.

| Types | Description |
| :- | :- |
| person | Specifies that the name is persons name.
| place | The name contains name of the place.
| org | Name of the organisation.

Names can also refer to predefined people or places with `ref` attribute.

### Person name
```xml
<persName ref="#Person_A2E">Aragorn</persName>
```
This element should be used only for a proper noun or proper-noun phrase referring to a person, possibly including one or more of the person's forenames, surnames, honorifics, added names, etc. **`persName` is an equivalent to `<name type="person"></name>`.** Additional level of description can be achieved by using `forename`, `surname` and other elements, see [marking up people](./people-and-places.md#marking-up-people) as these tags are same. The `ref` attribute should be used to link the person to the `listPerson` in the `teiHeader`.

### Place name
```xml
<placeName ref="#UniFr">Université de Fribourg</placeName>
```
It should contain an absolute or relative place name. **The `placeName` element is a equivalent to `<name type="place"></name>`.** Additional level of description can be achieved in a similar fashion as with the person, see [describing places](./people-and-places.md#describing-places). The `ref` attribute should be used to link the place to the `listPlace` in the `teiHeader`.

### Organization name
```xml
<orgName ref="#UniFr">Université de Fribourg</orgName>
```
It should contain an organization name. **The `orgName` element is a equivalent to `<name type="org"></name>`.** Additional level of description can be achieved in a similar fashion as with the person and place, see [list of organizations](./people-and-places.md#list-of-organizations). The `ref` attribute should be used to link the place to the `listOrg` in the `teiHeader`.

::: warning Do not duplicate!
As all three forementioned elements can be described with additional elements in similar fashion as the items in lists (`listPerson`, `listPlace`, `listOrg`) do not be tempted to duplicate the infomration. These additional elements should be only used to achieve higher level of detail in the markup if the information is present in the original text.
:::


## Citation
During the encoding process you will find passages of text that are taken from other sources. It is important to identify them and categorize them.

### Cited quotation
```xml
<cit type="ascribed literal">
  <bibl>
    <!-- Author's name -->
  </bibl>
  <quote>
    <!-- the actual citation -->
  </quote>
  <ref cRef="Gn 1:1">
    <!-- link to the Biblical source and optional description -->
  </ref>
</cit>
```
Contains a quotation from some other document, together with a bibliographic reference to its source. In a dictionary it may contain an example text with at least one occurrence of the word form, used in the sense being described, or a translation of the headword, or an example.

| Type | Description
| :- | :-
| ascribed | If the citation is ascribed to someone
| biblie | Should be used only for biblical citations
| example | If the citation serves as an example
| literal | Citation is literal
| paraphrase | The text was paraphrased

::: tip
Types can be combined as can be seen in the example above. It is important to keep the space between each type.
:::

#### Quote
```xml
<quote>In principio creavit Deus celum et terram.</quote>
```
The only mandatory element in the citation part. It must contain a phrase or passage attributed by the narrator or author to some agency external to the text.

::: warning Important
It may happen that a reference is made without actually quoting it. Since this is not actual quotation, we should avoid
using `quote` element, but `ref` and `bibl` elements can still be used. This kind of citation should still be inside a `cit` element for the sake of consistency.
::: details See the example
```xml{2}
<cit type="ascribed">
  Augustine says he stole pears in a garden when he was a young man
  <ref target="#AugConf">
    <bibl type="source">Aug., <title>Confessiones</title>, II, 4</bibl>
  </ref>
</cit>
```
Note that `quote` element was omitted and only `cit` and `ref` were kept.
:::

#### Reference
```xml
<ref target="#BernEpist"></ref>
<!-- Or when refering to Bible -->
<ref cRef="Gn 1:1"></ref>
```
Defines a reference to another location, possibly modified by additional text or comment. It can be used as an
self-closing element `<ref />` if no further description is provided. As can be seen in the example above, there
are also two different uses of the tag. The `cRef` is mutually exclusive with `target` and should be used only if
is referred to the Bible. In all other cases `target` attribute should be used.

##### Biblical citations
```xml{3}
Unde in Genesim: <cit type="bible">
<quote>In principio creavit Deus celum et terram.</quote>
<ref cRef="Gn 1:1" decls="#biblicalCitations">This is a literal quotation of the first verse of the Bible</ref>
</cit>
```
As can be seen the whole citation is inside the `cit` element with attribute `type` set to the Bible. The quotation itself
is inside the `quote` element and followed by a reference linking to the Genesis with a further description.

::: tip
In case of a biblical citations with descriptions were used, following snippet should be also included in `<encodingDesc>` inside the
`<teiHeader>` section, see [tei header](./tei-header.md#encoding-description).

::: details Click to view the snippet
```xml
<refsDecl xml:id="biblicalCitations">
  <cRefPattern matchPattern="(.+) (.+):(.+)" replacementPattern="http://vulsearch.sourceforge.net/html/$1.html#x$2_$3">
    <p>This pointer pattern extracts and references the
    <q>book,</q> <q>chapter,</q> and <q>verse</q> parts of a biblical
    reference pointing to a single verse, like “Gn 1:1”, and
    reconstructs a link to an online version of the biblical
    text.</p>
  </cRefPattern>
</refsDecl>
```
:::

##### Other sources
```xml{4,5}
Bernardus: <cit type="ascribed">
<quote>Auferatur malus ne generet malos. Non potest arbor mala
fructus nisi malos facere.</quote>
<ref target="#bernEpist"><bibl><author>Bern.</author>,
<title>Epist.</title>, 102 (VIII, 257-8)</bibl></ref>
</cit>
```
For other sources above example should be used. Note that `ref` element does contain other more specifying elements like
title, author and bible. These elements were also used for bibliography, [see](./bibliography.md). The `target` attribute
is also refering to the unique ID used in the bibliographic section of our document.


#### Bibliographic citation
```xml
<bibl></bible>
```
As was described in the example above, this element is used to contain a loosely-structured bibliographic citation with
sub-components like `author`, `title` and so on, see [bibliography](./bibliography.md) for more information.


## Different readings
Many digital editions are based on number of sources of the same text. Thus, it is often needed to differentiate between various readings
and keep track of them. The set of elements that can be used for that purpose will follow:

### Apparatus entry
```xml
<app >
  <lem><!-- lemma --></lem>
  <rdg><!-- reading --></rdg>
</app>
```
Contains one entry in a critical apparatus, with an optional lemma and usually one or more readings or notes on the relevant passage.

#### Lemma
```xml
<lem wit="#A17">
  Equo baio sedere: expeditionem significat.
</lem>
```
Contains the lemma, or base text, of a textual variation. This element is optional as the apparatus entry can contain only readings without lemma suggestion.
The attribute `wit` should be used to identify the source in the list of witnesses `listWit`, see [witness description](./source-description.md).

#### Readings
```xml
<rdg wit="#C72 #D109">
  Equos rufos vel baios habere: bonum nuntium significat.
</rdg>
```
Contains a single reading within a textual variation. Likewise the `lemma` element the `rdg` element should contain attribute
`wit` that will point to the list of witnesses.

::: tip
Note that IDs of different sources with the same reading are separated with space.
:::

Readings can contain additions, corrections and deletions, all these topics are further described on the [Text corrections](./additions-deletions.md) page.

## Lacuna
```xml{4}
<app>
  <lem wit="#El #Hg">Auctoritee</lem>
  <rdg wit="#La #Ra2 #X">
    <lacunaEnd wit="#X"/>auctorite
  </rdg>
</app>
```
If a witness is incomplete (whether a single fragment, a series of fragments, or a relatively complete text with one or more lacunae), it is usually desirable to record explicitly where its preserved portions begin and end. The following empty tags, which may occur within any lem or rdg element, indicate the beginning or end of a fragmentary witness or of a lacuna within a witness. In the example above the text of the exemplar X starts with auctorite, thus the lacuna ends there.

### Lacuna start
```xml
<lacunaStart wit="#X" />
```
Indicates the beginning of a lacuna in the text of a mostly complete textual witness.

### Lacuna end
```xml
<lacunaEnd wit="#X" />
```
Indicates the end of a lacuna in a mostly complete textual witness.

