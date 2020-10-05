# Regula sancti Benedicti

The following example contains part of the _Regula sancti Benedicti_ written for women. This text was initialy encoded during the [Digital Editing of Medieval Manuscripts](https://www.digitalmanuscripts.eu) training programme and thus can be seen [online](http://demm.silencesys.com/karel/).

## What is encoded
- The title and the publication statement are shortened to contain only necessary information
- Source description containes one withness with further physical description
- Only list of people with basic information is provided
- The women version of regula is encoded from manuscript, the men version is taken from standard edition and is here only for display without any further linking
- People and biblical references are encoded using `persName` and `cit` elements and are linked to lists with reference attribute `ref`
- Correction and glosses were marked in the text, the glosses are language specific
- Segments `seg` are used for commentaries that are written around the regula itself, each segment is linked to proper paragraph `p`

## Encoded example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
      <fileDesc>
         <titleStmt>
            <title type="main">Regula sancti Benedicti</title>
            <title type="desc"> cum commentario monialibus adapta</title>
         </titleStmt>
         <publicationStmt>
            <publisher>manuscriptorium.com</publisher>
         </publicationStmt>
         <sourceDesc>
          <listWit>
            <witness>
              <msDesc xml:id="IF29en" xml:lang="eng">
                <msIdentifier>
                  <country>Bohemia</country>
                  <settlement>Prague</settlement>
                  <repository>National Library of the Czech Republic</repository>
                  <idno>I F 29</idno>
                </msIdentifier>
                <msContents/>
                <physDesc>
                  <objectDesc form="other">
                    <supportDesc>
                      <extent>ff. 175
                      <dimensions unit="cm">
                      <height>21</height>
                      <width>15</width>
                      </dimensions>
                      <material>paper</material>
                      </extent>
                    </supportDesc>
                  </objectDesc>
                </physDesc>
              </msDesc>
            </witness>
            </listWit>
            <listPerson>
               <person xml:id="Person_Benedikt">
                  <persName>Benedict of Nursia</persName>
                  <birth when="0480-01-01">c. 480</birth>
                  <death when="0545-01-01">c. 545</death>
                  <note type="bibliographical">
                    Benedict of Nursia was the author of the Rule of St. Benedict. He founded the monastery of Monte Cassino and became its first abbot.
                  </note>
               </person>
               <person xml:id="Person_Job">
                  <persName>Job</persName>
                  <note type="bibliographical">
                    Job is the central figure of the Book of Job in the Bible (Old Testament). Job is presented as a good and prosperous family man who is beset with horrendous disasters that take away all that he holds dear, including his offspring, his health, and his property. He struggles to understand his situation and begins a search for the answers to his difficulties.
                  </note>
               </person>
            </listPerson>
         </sourceDesc>
      </fileDesc>
  </teiHeader>
  <text>
      <body>
        <div xml:lang="lat" type="original">
          <div xml:id="version_women" n="Caput 30">
              <head><seg xml:id="lem01">De puellis minori etate, qualiter corripiantur XXX</seg></head>
              <p>
                Omnis etas <add place="above"><gloss xml:lang="czo">vyek</gloss></add> vel intellectus <add place="above"><gloss xml:lang="czo">rozum</gloss></add> debet proprias habere <seg xml:id="lem02">mensuras</seg> <add place="above"><gloss xml:lang="lat">modos</gloss></add>. Ideoque, quociens <seg xml:id="lem03">puelle</seg> <add place="above"><gloss xml:lang="lat">VII vel IX annorum</gloss></add> vel adolescenciores etate <add place="above"><gloss xml:lang="lat">XIIII vel quindecim annorum</gloss></add>, <seg xml:id="lem04">aut que minus intelligere possunt</seg> <add place="above"><gloss xml:lang="lat">valent</gloss></add> quanta <add place="above"><gloss xml:lang="lat">id est quam magna</gloss></add> pena sit excommunicacionis <add place="above"><gloss xml:lang="lat">separacionis</gloss></add>. <seg xml:id="lem05">Hec tales</seg> <add place="above"><gloss xml:lang="lat">supple puelle</gloss></add>, dum delinqunt <add place="above"><gloss xml:lang="lat">excedunt</gloss></add>, aut ieiuniis nimiis <add place="above"><gloss xml:lang="lat">magnis</gloss></add> affligantur <add place="above"><gloss xml:lang="lat">castigentur</gloss></add> aut acris <add place="above"><gloss xml:lang="lat">duris</gloss></add> verberibus coherceantur <add place="above"><gloss xml:lang="lat">corigatur</gloss></add>, ut sanentur <add place="above"><gloss xml:lang="czo">tyessye pokanye nezly</gloss></add> <add place="above"><gloss xml:lang="lat">miserere mei Deus</gloss></add>.</p>
          </div>
          <div xml:id="version_men" n="Caput 30">
              <head>De pueris minori aetate, qualiter corripiantur XXX</head>
              <p>
                Omnis aetas vel intellectus proprias debet habere mensuras. Ideoque, quotiens pueri vel adulescentiores aetate, aut qui minus intellegere possunt quanta poena sit excommunicationis. Hi tales dum delinquunt, aut ieiuniis nimiis affligantur aut acris verberibus coerceantur, ut sanentur.
              </p>
          </div>
          <div xml:id="commentary">
              <p corresp="#lem01">
                Superius egit de penis non distringendo personarum qualitates, sed ne forte crederet alique quod equaliter omnes essent corrigende, puelle, adolescentes, senes, iuvenes, prudentes et insipientes, subponitur hic rubrica de correccione minorum etatis.
              </p>
              <p corresp="#lem02">
                Attende hic discretissimum et notabile <persName ref="#Person_Benedikt">almifici patris</persName> verbum, ut nichil sine mensura debite discrecionis agatur.
              </p>
              <p corresp="#lem03">
                Puelle dicuntur usque ad XIIII annum. Adolescencia a XIIII anno usque ad vicesimum octavum.
              </p>
              <p corresp="#lem04">
                Cum dicit "aut que minus intelligere possunt", quantum enim in hanc etatem comprehendit.
              </p>
              <p corresp="#lem05">
                "Hec tales..." Iste enim due pene videlicet ieiunia et verbera ad coporalem referuntur vindictam, sed quibusdam competit ieiunium et quibusdam flagella, quibus sunt ieiunia contraria debent flagellari virgis, lascive puelle, id est fregerzky, <del>kacz</del> tanecznycze debent nimiis ieiuniis castigari et domari at by nochy neplessaly any <choice><sic>skaly</sic><corr>skakaly</corr></choice>, ut <persName ref="#Person_Job">Yob</persName> dicebat: <cit type="bible"><quote><ref target="http://biblehub.com/multilingual/job/13-27.htm">Posuisti in nervo pedem me<supplied>um</supplied>.</ref></quote><bibl>Job 13,27</bibl></cit>
              </p>
          </div>
         </div>
      </body>
  </text>
</TEI>
```