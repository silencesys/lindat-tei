# Witness description

Contains either a description of a single witness referred to within the critical apparatus, or a list of witnesses which is to be referred to by a single sigil.
All witnesses in `sourceDesc` must be listed inside an `listWit` element as can be seen in the [example](./tei-header.md#source-descriptio). The `xml:id` attribute
should always contain an unique manuscript identifier - siglum. All below described tags **must** be inside the `msDesc` element.

```xml
<witness xml:id="A17">
  <msDesc>
    <!-- Manuscript description -->
    <msIdentifier>
      <!-- Manuscript identification -->
    </msIdentifier>
    <msCotents>
      <!-- Description of intellectual content -->
    </msContents>
    <physDesc>
      <!-- Physical description -->
    </physDesc>
  </msDesc>
</witness>
```

## Manuscript identifier
```xml{2-10}
<msDesc>
  <msIdentifier>
    <country>Czech Republic</country>
    <region><!-- Region can be omnited if not set --></region>
    <settlement>Třeboň</settlement>
    <institution>Státní oblastní archiv Třeboň</institution>
    <repository><!-- Can be omnited if not specified --></repository>
    <collection>Rukopisy Třeboň</collection>
    <idno>A 17</idno>
  </msIdentifier>
  <msCotents></msContents>
</msDesc>
```

The msIdentifier element is intended to provide an unambiguous means of uniquely identifying a particular manuscript. This may be done in a structured way, by providing information about the holding institution and the call number, shelfmark, or other identifier used to indicate its location within that institution. Alternatively, or in addition, a manuscript may be identified simply by a commonly used name.

#### Country
```xml
<country>Czech Republic</country>
```
Contains the name of a geo-political unit, such as a nation, country, colony, or commonwealth, larger than or administratively superior to a region and smaller than a bloc.

#### Region
```xml
<region></region>
```
Contains the name of an administrative unit such as a state, province, or county, larger than a settlement, but smaller than a country. _This element is optional._

#### Settlement
```xml
<settlement>Prague</settlement>
```
Contains the name of a settlement such as a city, town, or village identified as a single geo-political or administrative unit.

#### Institution
```xml
<institution>Státní oblastní archiv Třeboň</institution>
```
Contains the name of an organization such as a university or library, with which a manuscript or other object is identified, generally its holding institutio

#### Repository
```xml
<repository></repository>
```
Contains the name of a repository within which manuscripts or other objects are stored, possibly forming part of an institution. _This element is optional._

#### Collection
```xml
<collection>Rukopisy Třeboň</collection>
```
Contains the name of a collection of manuscripts or other objects, not necessarily located within a single repository.

#### Unique identificator
```xml
<idno>A 17</idno>
```
Supplies any form of an identifier used to identify some object, such as a bibliographic item, a person, a title, an organization, etc. in a standardized way.

## Manuscript contents
```xml{3-8}
<msDesc>
  <msIdentifier></msIdentifier>
  <msContents>
    <summary></summary>
    <msItem>
      <!-- Manuscript item -->
    </msItem>
  </msContents>
</msDesc>
```

The msContents element is used to describe the intellectual content of a manuscript or manuscript part. It comprises either a series of informal prose paragraphs or a series of msItem or msItemStruct elements, each of which provides a more detailed description of a single item contained within the manuscript. These may be prefaced, if desired, by a summary element, which is especially useful where one wishes to provide an overview of a manuscript's contents and describe only some of the items in detail.

### Summary
```xml
<summary></summary>
```
Contains an overview of the available information concerning some aspect of an item or object (for example, its intellectual content, history, layout, typography etc.) as a complement or alternative to the more detailed information carried by more specific elements.

### Manuscript item
```xml
<msItem n="1">
  <locus from="4v" to="23r">ff. 4v-23r</locus>
  <title xml:lang="lat">Somniale Danielis</title>
</msItem>
```
Describes an individual work or item within the intellectual content of a manuscript, manuscript part, or other object. The order of elements
inside the `<msItem>` element should be kept.

#### Locus
```xml
<locus from="4v" to="23r" facs="image.jpg">ff. 4v-23r</locus>
```
Defines a location within a manuscript, manuscript part, or other object typically as a (possibly discontinuous) sequence of folio references.
Attributes `from` and `to` should point to the location of the text in manuscript. Attribute `facs` can be used to link locus with a particular image.
::: warning Important
In case you will link locus to images, please include these images with your XML file as well
:::

#### Title
```xml
<title xml:lang="lat">Somniale Danielis</title>
```
The element must always contain the title of the document which is present in the manuscript, if there is any. Similarly
like in previous cases the `xml:lang` attribute must contain valid ISO-639-3 language code.
For list of language codes see [language codes](./language-codes.md).

## Physical Description
```xml{2-5}
<msDesc>
  <physDesc>
    <objectDesc form="codex"></objectDesc>
    <handDesc hands="1"></handDesc>
  </physDesc>
</msDesc>
```
Under the general heading ‘physical description’ we subsume a large number of different aspects generally regarded as useful in the description of a given manuscript. These include:
+ aspects of the form, support, extent, and quire structure of the manuscript object and of the way in which the text is laid out on the page
+ the styles of writing, such as the way it is laid out on the page, the styles of writing, decorative features, any musical notation employed and any annotations or marginalia
+ and discussion of its binding, seals, and any accompanying material

### Object Description
```xml
<objectDesc form="codex">
  <p>
    <material>Parchment</material> codex with half <material>goat-leather</material>.
  </p>
</objectDesc>
```
The `objectDesc` element is used to group together those parts of the physical description which relate specifically to the text-bearing object, its format, constitution, layout, etc. The `objectDesc` element is used for grouping the elements relating to the physicality of a text-bearing object as part of a manuscript description. If a full description of an object (text-bearing or not) is desired, the more general object element may be preferred. The `form` attribute is used to describe form of the manuscript, see table below.

| Form |
|:- |
| codex |
| roll |
| vellum |
| composite_manuscript |

#### Material
```xml
<material>Parchment</material> codex with half <material>goat-leather</material>.
```
The element should be used inside a paragraph to tag any specific physical material of which manuscript is composed. Possible materials can be: parchment, paper, calfskin, goatskin, mixed.

### Hands description
```xml
<handDesc hands="2"></handDesc>
```
Contains a description of all the different hands used in a manuscript or other object.

#### Scribers are unknown
```xml
<handDesc hands="2">
  <handNote xml:id="S1unknown">
    <p>idetifies the scribe of the manuscripts</p>
  </handNote>
  <!-- handNote can be repeated as many times as needed -->
</handDesc>
```
The element `<handNote>` describes a particular style or hand distinguished within a manuscript. The description of
writers characteristic must be always inside the paragraph element `<p>`. The `xml:id` attribute must always contain
an unique value, thus it is recommended to identify scribers with prefix starting with letter `S`.

#### Scribers are known
```xml
<handDesc hands="2">
 <handNote xml:id="S2Eirsp" scope="major">
  <p>The first part of the manuscript, <locus from="1v" to="72v:4">fols
       1v-72v:4</locus>, is written in a practised Icelandic Gothic bookhand. This hand
     is not found elsewhere.</p>
 </handNote>
 <!-- handNote can be repeated as many times as needed -->
</handDesc>
```
As above the `<handNote>` element is used to describe the scribe, but because it is known which part was written by which
scribe. It can be used `<locus>` element to specify parts which were written with this hand, see [`<locus>`](#locus) for more information about the element.
Also the attribute `scope` can be used to specify how widely was this hand used in manuscript.

| scopes | description |
| :- | :- |
| sole | only this hand is used throughout the manuscript
| major | this hand is used through most of the manuscript
| minor | this hand is used occasionally in the manuscript

If you know other works written by the same hand. It can be noted inside the `<handNote>` element by
providing the title of the other within the `<title>` element followed by `ref` element specifying the location.
See example below.

```xml
<handDesc hands="2">
 <handNote xml:id="S2Eirsp" scope="minor">
  <p>The second part of the manuscript, <locus from="72v:4" to="194v">fols
       72v:4-194</locus>, is written in a hand contemporary with the first; it can also
     be found in a fragment of <title>Knýtlinga saga</title>, <ref>AM 20b II
       fol.</ref>.</p>
 </handNote>
</handDesc>
```

## History
```xml
<history>
  <origin></origin>
  <provenance></provenance>
  <acquistion></acquisition>
</history>
```
The above elements are used to record information about the history of a manuscript.

### Origin
```xml
<origin>
  <p> Written in
    <origPlace>
      <country>Czech Republic</country>
      <region><!-- Region, can be omnited --></region>
      <settlement>Prague</settlement>
      <institution><!-- Name where was the manuscript written --></institution>
    </origPlace>
    <origDate notBefore="1248-01-01" notAfter="1348-01-01">
      Not before 1248 and not after 1348.
    </origDate>
  </p>
</origin>
```
Contains any descriptive or other information concerning the origin of a manuscript, a manuscript part, or another object. The
description should be written in prose inside the paragraph `<p>`. However, additional tags that specify information can be
used.

#### Original place
Contains any form of place name, used to identify the place of origin for a manuscript, a manuscript part, or other object. Follow
similar rules as any other element specifying location, see [this example](#manuscript-identifier).

#### OrigDate
Contains any form of date, used to identify the date of origin for a manuscript, manuscript part, or other object. Follows same
rules as any other date element, see [this example](./tei-header.md#date).

### Provenance
```xml
<p>Given to <name type=“person“>W.Olleyf</name> by <name type=“person“>William Ebchester</name>, Prior (1446-56) and later belonged to <name type=“person“>Henry Dalton</name>, Prior of <name type=“place“>Holy Island (Lindisfarne)</name> according to inscriptions on ff. 4v and 5.</p>
```
Contains any descriptive or other information concerning a single identifiable episode during the history of a manuscript, a manuscript part, or another object after its creation but before its acquisition. They should be written in prose inside a paragraph `<p>` and may contain additional tags.

#### Name
```xml
<name type="place" ref="#Place_Prague">Name</name>
```
Contains a proper noun or noun phrase.

| Types | Description |
| :- | :- |
| person | Specifies that the name is persons name.
| place | The name contains name of the place.
| org | Name of the organisation.

Names can also refer to predefined people or places with `ref` attribute.

### Acquisition
```xml
<acquistion>
  <p>Left to the <name type=“place“> Bodelian</name> by <name type=“person“>Richard Rawlinson</name> in 1775.</p>
</acquisition>
```
Contains any descriptive or other information concerning the process by which a manuscript or manuscript part or other object entered the holding institution. Similarly as with the [provenance](#provenance) additional elements can be used. Should be written in prose inside a paragraph tag `<p>`.
