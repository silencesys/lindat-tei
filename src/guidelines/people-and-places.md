# People and places

It is strongly advised to also include a list of people, places and organisations at one place in the document so it can later be used to link to these lists from the text itself, similarly like with the witnesses. For this purpose we should include the `listPerson` and `listPlace` sections inside the `sourceDesc` part of the `teiHeader`.

::: details See the extended source description
```xml
<sourceDesc>
  <p>General description</p>
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
</sourceDesc>
```
:::

## Marking up people
```xml
<person xml:id="Person_A2E" sex="male">
  <persName>
    <foreName>Aragorn</foreName>
    <genName>II</genName>
    <genName>Elassar</genName>
  </persName>
  <age value="210" notAfter="3000">210 years old</age>
  <note>
    Aragorn II, son of Arathorn II and Gilraen, also known as Elessar and Strider, was the 16th Chieftain of the Dúnedain of the North;
    later crowned King Elessar Telcontar (March 1, 2931 - FO 120 or SR 1541), the 26th King of Arnor and 35th King of Gondor -
    and first High King of Gondor and Arnor since the short reign of Isildur.
  </note>
</person>
```
Each person should be wrapped inside the `person` element with a unique id. It is recommeneded to add prefix as `Person_` to the actual actual ID, so it won't collide with other IDs later.
Additional descriptive elements can be used. The attribute `sex` can be used to determine person's gender. Valid values are `male`, `female`, `unknown`.

### Name of the person
```xml{1,5}
<persName>
  <forename>Aragorn</forename>
  <genName>II</genName>
  <addName>Elassar</addName>
</persName>
```
The `persName` element should contains a proper noun or proper-noun phrase referring to a person, possibly including one or more of the person's forenames, surnames, honorifics, added names, etc. For this purpose additional descriptive elements should be used.

#### Forename
```xml
<forename>Aragorn</forename>
```
The `forename` element should contain a forename, given or baptismal name.

#### Surname
```xml
<surname>Novák</surname>
```
The `surname` contains a family (inherited) name, as opposed to a given, baptismal, or nick name.

#### Generational name component
```xml
<genName>II</genName>
<!-- also possible -->
<genName>the Younger</genName>
```
The `genName` contains a name component used to distinguish otherwise similar names on the basis of the relative ages or generations of the persons named.

#### Role name
```xml
<roleName>Earl of Bath</roleName>
```
The `roleName` contains a name component which indicates that the referent has a particular role or position in society, such as an official title or rank.

#### Name link
```xml
<nameLink>of</nameLink>
```
The `nameLink` contains a connecting phrase or link used within a name but not regarded as part of it, such as van der or of.

#### Added name
```xml
<addName>Elassar</addName>
<!-- or -->
<addName>the Great</addName>
```
The `addName` contains an additional name component, such as a nickname, epithet, or alias, or any other descriptive phrase used within a personal name

#### Place name
```xml
<placeName>Kroměříž</placeName>
```
The `placeName` contains an absolute or relative place name.

### Birth and death
```xml
<birth when="-0044-03-20">March 20th 43 BC.
<placeName>
  <settlement type="city">Sulmona</settlement>
  <country key="IT">Italy</country>
</placeName>
</birth>
<death notBefore="0017" notAfter="0018">17 or 18 AD
  <placeName>
    <settlement type="city">Tomis (Constanta)</settlement>
    <country key="RO">Romania</country>
  </placeName>
</death>
```
Person descriptions can contain information about it's birth and death. These elements can include additional describing elements as in example. More information about these elements can be found in the [Place](#place) section.

### Age
```xml
<age value="210" notAfter="3000-01-01">210 years old</age>
```
To describe the age of the person the `age` element can be used. The element can contain only number, or number with additional information. In both cases the attribute `value` should be set to exact age or if it is unknown we can use attributes `notAfter` and `notBefore`. These two attributes should contain valid date in the following format `YYYY-MM-DD`.

### Faith
```xml
<faith>pagan</faith>
```
The element specifies the faith, religion, or belief set of a person.

### Additional notes
```xml
<note>Aragorn II, son of Arathorn II and Gilraen...</note>
```
The `note` element can be used to provide further information about the person.

<br>

::: tip Additional information
The `person` element is further described in the [TEI documentation guide](https://tei-c.org/release/doc/tei-p5-doc/en/html/ND.html). There is also extensive list of additional descriptive tags that were omitted from this guide, but can be used.
:::

## Describing places
```xml
<place xml:id="UniFr">
  <placeName xml:lang="fre">Université de Fribourg</placeName>
  <placeName xml:lang="ger">Universität Freiburg</placeName>
  <settlement>Fribourg</settlement>
  <region>Canton de Fribourg</region>
  <country key="CH">Suisse</country>
  <location>
    <geo>46.80625, 7.15174</geo>
    <address>
      <addrLine>Avenue de l'Europe 20</addrLine>
      <addrLine>CH-1700 Fribourg</addrLine>
    </address>
  </location>
</place>
```
The `place` element should contain information about the geo-political or geographical place. Additional descriptive tags can be used to provide further information about the place. In the example above the University of Frideburg is described in detail.

### Place name and/or geographic name
```xml
<placeName xml:lang="fre" type="university">Université de Fribourg</placeName>
<!-- but also -->
<geogName xml:lang="eng" type="river">Mississippi River</geogName>
```
The `placeName` element should be used whenever the geo-political place is described. It should contain the `xml:lang` attribute that describes the language used in the name. The `type` attribute can be used to further describe type of the place eg. `university`, `state`, `city` and so on. For geographical places like rivers, lakes and mountains `geogName` element can be used. Similarly like with `placeName` the `xml:lang` should contain the language abbreviation. In similar fashion as with the `placeName` the `type` attribute can be used to further informn about the type of the place. Possible types: `river`, `lake`, `mountain`, `ridge` etc.

::: tip Place types
Types of places are not defined by us, so it's up to you, but keep them as short as possible. If you need to use more than one word, keep them hyphenated as whitespaces are used as separators.
:::

### Settlement
```xml
<settlement type="city">Fribourg</settlement>
```
The `settlement` element contains the name of a settlement such as a city, town, or village identified as a single geo-political or administrative unit. The `type` attribute can be used to provide further categorization.

### Region
```xml
<region>Canton de Fribourg</region>
```
The `region` element contains the name of an administrative unit such as a state, province, or county, larger than a settlement, but smaller than a country. The `type` attribute can be used to provide further categorization.

### Country
```xml
<country>Suisse</country>
```
The `region` element contains the name of a geo-political unit, such as a nation, country, colony, or commonwealth, larger than or administratively superior to a region and smaller than a bloc.

### Location
```xml
<location>
  <geo>46.80625, 7.15174</geo>
  <address>
    <addrLine>Avenue de l'Europe 20</addrLine>
    <addrLine>CH-1700 Fribourg</addrLine>
  </address>
</location>
```
Defines the location of a place as a set of geographical coordinates, in terms of other named geo-political entities, or as an address. Additional descriptive elements can be used. The forementioned elements as `country`, `region` and `settlement` can also be used inside the `location` tag, for examples see [location of organization](#location-of-the-organization).

#### Geographical coordinates
```xml
<geo>46.80625 7.15174</geo>
```
Contains any expression of a set of geographic coordinates, representing a point, line, or area on the surface of the earth in some notation. The pair of numbers should be always separated with the whitespace as they will be interpreted as latitude followed by longitude according to the World Geodetic System.

#### Adress
```xml
<address>
  <addrLine>Avenue de l'Europe 20</addrLine>
  <addrLine>CH-1700 Fribourg</addrLine>
</address>
```
Contains a postal address, for example of a publisher, an organization, or an individual.

<br>

::: tip Additional information
The `place` element is further described in the [TEI documentation guide](https://tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDPLAC). There is also extensive list of additional descriptive tags that were omitted from this guide, but can be used.
:::

## Lists of organizations
```xml
<org xml:id="Org_TB">
  <orgName xml:lang="eng" notAfter="1960">The Silver Beetles</orgName>
  <orgName xml:lang="eng" notBefore="1960">The Beatles</orgName>
  <location>
    <country>United Kingdom</country>
    <city>Liverpool</city>
  </location>
  <desc>
    The group, whose best-known line-up comprised John Lennon, Paul McCartney, George Harrison and Ringo Starr, are regarded as the most influential band of all time.
  </desc>
</org>
```
The `org` element provides information about an identifiable organization such as a business, a tribe, or any other grouping of people. Organisation should have `xml:id` attribute with a unique ID, it is recommended to use `Org_` as a prefix to the ID so it won't collide with other IDs in the document.

### Name of the organization
```xml
<orgName xml:lang="eng" notAfter="1960">The Silver Beetles</orgName>
```
The element should contain an organizational name. The attribute `xml:lang` should contain the language abbreviation. Additional attributes like `notAfter` or `notBefore` can be used if the name of the organization was changed over the time.

### Location of the organization
```xml
<location>
  <country>United Kingdom</country>
  <settlement>Liverpool</settlement>
</location>
```
This element should contain description of the location where the organization can be found. It can contain `geo` location and `address` as was described in the [place location](#location) or relative description in tags as `country`, `region` and `settlement`.

### Description
```xml
<desc>The group, whose best-known line-up comprised John Lennon...</desc>
```
The `description` element can be used to provide further information about the organization.