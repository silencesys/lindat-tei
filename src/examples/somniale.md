# Somniale Danielis

The following example contains part of the _Somniale Danielis_ dreambook.

## What is encoded
- The title and the publication statement with license
- Source description contains lists of witnesses, people, places and bibliography
- Bibliography is divided into two groups and encoded in structured view
- People and places in lists are described with basic information
- The encoded text uses two witnesses and provides translation to czech
- People, places and biblical references are encoded using `persName`, `placeName` and `ref` elements and linked to lists with reference attribute `ref`
- Some abbreviations and corrections are encoded, corrections were made on places where the text was apparently incorrect
- Translation to czech is provided at the end of the document

## Encoded example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="https://tei-c.org/Vault/P5/current/xml/tei/custom/schema/xsd/tei_all.xsd" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="https://tei-c.org/Vault/P5/current/xml/tei/custom/schema/xsd/tei_all.xsd" type="application/xml"
	schematypens="http://purl.oclc.org/dsdl/schematron"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title xml:lang="lat">Somniale Danielis</title>
                <title xml:lang="eng">Dreambook of Daniel</title>
                <title xml:lang="cze">Danielův snář</title>
                <author xml:id="Author_Unknown">Unknown author</author>
                <respStmt>
                  <resp>Transribed and encoded by</resp>
                  <name>Martin Roček</name>
                </respStmt>
            </titleStmt>
            <publicationStmt>
                <publisher>Faculty of Arts</publisher>
                <pubPlace>
                    <country>Czech Republic</country>
                    <settlement>Prague</settlement>
                </pubPlace>
                <date when="2020-10-03">
                  3rd October 2020
                </date>
                <availability>
                  <p>This is an open access work licensed under a Creative Commons Attribution 4.0 International license.</p>
                </availability>
            </publicationStmt>
            <sourceDesc>
              <!-- List of witnesses -->
              <listWit>
                <witness xml:id="Witness_A">
                  <msDesc>
                    <msIdentifier>
                      <country>Czech Republic</country>
                      <settlement>Třeboň</settlement>
                      <institution>Státní oblastní archiv Třeboň</institution>
                      <collection>Rukopisy Třeboň</collection>
                      <idno>A 17</idno>
                    </msIdentifier>
                    <msContents>
                      <summary>
                        <!-- Some summary I should write later -->
                      </summary>
                      <msItem n="1">
                        <locus from="58v" to="61r">ff. 58v-61r</locus>
                        <title xml:lang="lat">Somniale Danielis</title>
                      </msItem>
                    </msContents>
                    <physDesc>
                      <objectDesc form="codex">
                        <p>
                          <material>Parchment</material>.
                        </p>
                      </objectDesc>
                      <handDesc xml:id="Scriber_Unknown" hands="1">
                        <p>Written by one hand, the scriber is unknown.</p>
                      </handDesc>
                    </physDesc>
                  </msDesc>
                </witness>
                <witness xml:id="Witness_D">
                  <msDesc>
                    <msIdentifier>
                      <country>Czech Republic</country>
                      <settlement>Prague</settlement>
                      <institution>Archive of Prague Castle</institution>
                      <collection>Archive of the Prague Metropolitan Chapter</collection>
                      <idno>D CIX</idno>
                    </msIdentifier>
                    <msContents>
                      <summary>
                        <!-- Some summary I should write later -->
                      </summary>
                      <msItem n="1">
                        <locus from="207v" to="214v">ff. 207v-214v</locus>
                        <title />
                      </msItem>
                    </msContents>
                    <physDesc>
                      <objectDesc form="codex">
                        <p>
                          <material>Parchment</material>.
                        </p>
                      </objectDesc>
                      <handDesc xml:id="Scriber_Unknown2" hands="1">
                        <p>Written by one hand, the scriber is unknown.</p>
                      </handDesc>
                    </physDesc>
                  </msDesc>
                </witness>
              </listWit>
              <!-- List of persons -->
              <listPerson>
                <person xml:id="Person_Daniel" sex="male">
                  <persName xml:lang="eng">
                    <forename>Daniel</forename>
                  </persName>
                  <socecStatus>Prophet</socecStatus>
                  <note>
                    Daniel (Aramaic and Hebrew: דָּנִיֵּאל‎ – Dāniyyēl,[a] meaning "God is my Judge"; Greek: Δανιήλ Daniḗl) is the hero of the biblical Book of Daniel.
                    A noble Jewish youth of Jerusalem, he is taken into captivity by Nebuchadnezzar of Babylon and serves the king and his successors with loyalty and ability until
                    the time of the Persian conqueror Cyrus, all the while remaining true to the God of Israel.
                  </note>
                </person>
                <person xml:id="Person_Joseph" sex="male">
                  <persName xml:lang="eng">
                    <forename>Joseph</forename>
                  </persName>
                  <socecStatus>Prophet</socecStatus>
                  <death notBefore="-1445-01-01" notAfter="-1444-01-01">
                    1445 BCE or 1444 BCE
                  </death>
                  <note>
                    In the biblical narrative, Joseph was sold into slavery by his jealous brothers, and rose to become vizier, the second most powerful man in Egypt next to Pharaoh, where his presence and office caused Israel to leave Canaan and settle in Egypt.
                  </note>
                </person>
                <person xml:id="Person_Pharaoh" sex="male">
                  <socecStatus>Pharaoh</socecStatus>
                  <note>
                    The Bible makes reference to various pharaohs (פַּרְעֹה‎, /paʁˈʕo/) of Egypt. These include unnamed pharaohs in the legends of the Israelite settlement in Egypt, the subsequent oppression of the Israelites, and the period of the Exodus. They also include several later rulers, some of whom can be identified with historical pharaohs.
                  </note>
                </person>
                <person xml:id="Person_Nebuchadnezzar" sex="male">
                  <persName xml:lang="eng">
                    <forename>Nebuchadnezzar</forename>
                    <genName>II.</genName>
                  </persName>
                  <persName xml:lang="cze">
                    <forename>Nebukadnesar</forename>
                    <genName>II.</genName>
                  </persName>
                  <persName xml:lang="lat">
                    <forename>Nabuchodnozor</forename>
                    <genName>II.</genName>
                  </persName>
                  <socecStatus>King of Babylon, King of Sumer and Akkad, King of the Universe</socecStatus>
                  <birth notBefore="-0630-01-01" notAfter="-0635-01-01">c. 633 BC.</birth>
                  <death when="-0562-10-07">7th October 562 BC</death>
                  <note>
                    Nebuchadnezzar ascended the throne in 605 BC and subsequently fought several campaigns in the West,
                    where Egypt was trying to organize a coalition against him. His conquest of Judah is described in
                    the Bible's Books of Kings, Books of Chronicles and Book of Jeremiah.
                  </note>
                </person>
              </listPerson>
              <!-- List of places -->
              <listPlace>
                <place xml:id="Place_Babylon" type="city">
                  <placeName xml:lang="eng">Babylon</placeName>
                  <placeName xml:lang="grc">Βαβυλών Babylṓn</placeName>
                  <region>Mesopotamia</region>
                  <bloc type="kingdom">Kingdom of Babylonia</bloc>
                  <location>
                    <geo>32.536389 44.420833</geo>
                  </location>
                </place>
                <place xml:id="Place_Jerusalem" type="city">
                  <placeName xml:lang="eng">Jerusalem</placeName>
                  <region>Middle East</region>
                  <location>
                    <geo>31.783333 35.216667</geo>
                  </location>
                </place>
              </listPlace>
              <!-- Bibliographical lists -->
              <listBibl>
                <head>Already known editions</head>
                <biblStruct xml:id="Edition_Martin" type="monography">
                  <monogr>
                    <author>
                      <persName>
                        <forename>Lawrence</forename>
                        <forename>Theodore</forename>
                        <surname>Martin</surname>
                      </persName>
                    </author>
                    <title xml:lang="lat" level="m" type="main">Somniale Danielis</title>
                    <title xml:lang="eng" level="m" type="sub">An Edition of a Medieval Latin Dream Interpretation Handbook</title>
                    <imprint>
                      <pubPlace>
                        <country>Germany</country>
                        <settlement>Frankfurt</settlement>
                      </pubPlace>
                      <publisher>Peter Lang Gmbh, Internationaler Verlag Der Wissenschaften</publisher>
                      <date when="1980-12-31">1980</date>
                    </imprint>
                  </monogr>
                </biblStruct>
                <biblStruct xml:id="Edition_Capozzo" type="dissertation">
                  <monogr>
                    <author>
                      <persName>
                        <forename>Valerio</forename>
                        <surname>Cappozzo</surname>
                      </persName>
                    </author>
                    <title xml:lang="eng" level="m" type="main">Editions of the Somniale Danielis in Medieval and Humanist Literary Miscellanies</title>
                    <note>Ph.D. dissertation</note>
                    <imprint>
                      <pubPlace>
                        <country>United States</country>
                        <settlement>Bloomington</settlement>
                      </pubPlace>
                      <publisher>Department of Italian, Indiana University</publisher>
                      <date when="2012-01-01">2012</date>
                    </imprint>
                  </monogr>
                </biblStruct>
                <!-- and so on ... -->
              </listBibl>
              <listBibl>
                <head>Selected bibliography</head>
                <biblStruct xml:id="Bibl_Keskiaho" type="monography">
                  <monogr>
                    <author>
                      <persName>
                        <forename>Jesse</forename>
                        <surname>Keskiaho</surname>
                      </persName>
                    </author>
                    <title xml:lang="eng" level="m" type="main">Dreams and Visions in the Early Middle Ages</title>
                    <title xml:lang="eng" level="m" type="sub">The Reception and Use of Patristic Ideas, 400–900</title>
                    <imprint>
                      <pubPlace>
                        <country>United Kingdom</country>
                        <settlement>Cambridge</settlement>
                      </pubPlace>
                      <publisher>Cambridge University Press</publisher>
                      <date when="2015-02-01">2015</date>
                    </imprint>
                  </monogr>
                </biblStruct>
                <!-- and so on ... -->
              </listBibl>
            </sourceDesc>
        </fileDesc>
        <encodingDesc>
          <refsDecl xml:id="biblicalCitations">
            <cRefPattern matchPattern="(.+) (.+):(.+)" replacementPattern="http://vulsearch.sourceforge.net/html/$1.html#x$2_$3">
              <p>This pointer pattern extracts and references the
              <q>book,</q> <q>chapter,</q> and <q>verse</q> parts of a biblical
              reference pointing to a single verse, like “Gn 1:1”, and
              reconstructs a link to an online version of the biblical
              text.</p>
            </cRefPattern>
          </refsDecl>
        </encodingDesc>
    </teiHeader>
    <text xmlns="http://www.tei-c.org/ns/1.0">
      <!--
        text of the document
        see: https://lindat.coders.tools/guidelines/text-structure.html
      -->
      <body>
         <div xml:lang="lat" type="original">
           <p xml:id="p1">Incipiunt sompniorum declaraciones, quas disposuit <persName ref="#Person_Daniel">Daniel</persName> propheta in <placeName ref="#Place_Babylon">Babilone</placeName> in diebus <persName ref="#Person_Nebuchadnezzar">Nabuchodonozor</persName> regis. Omnes enim populi tradebant sompnia <persName ref="#Person_Daniel">Danieli</persName> que videbant, ut solveret <rs type="person" ref="#Person_Daniel">propheta</rs> ut olim <ref cRef="Gn 41" decls="#biblicalCitations">gen. XI°</ref> <persName ref="#Person_Joseph">Ioseph</persName> <persName ref="#Person_Pharaoh">pharaoni</persName>. Hic <persName ref="#Person_Daniel">Daniel</persName> de sancta civitate <placeName ref="#Place_Jerusalem">Ierusalem</placeName> ductus in civitatem <placeName ref="#Place_Babylon">Babilonicam</placeName> ostendet, que vera sompnia sunt vel quibus diebus vera existunt vel in qua <choice><sic>linea</sic><corr>luna</corr></choice> non debent observari.</p>
           <p xml:id="p2">
            <choice><sic>Linea</sic><corr>Luna</corr></choice> prima quidquid videbis ad gaudium. <choice><sic>Linea</sic><corr>Luna</corr></choice> <choice><abbr>2a</abbr><expan>secunda</expan></choice> nihil ponas in animo tuo, quia nihil significat. <choice><sic>Linea</sic><corr>Luna</corr></choice> 3, 4, 5. fiat cito sopmnium et erit vel videbis sicut est. <choice><sic>Linea</sic><corr>Luna</corr></choice> 6, 7 custodi sopmnium Ut dicas alicui sed ora deum. <choice><sic>Linea</sic><corr>Luna</corr></choice> 8, 9 quidquid videbis certum est. <choice><sic>Linea</sic><corr>Luna</corr></choice> 10 non cogites de sompnio quia effectum non habet. Linea 11 infra dies 4 fiet sompnium tuum. <choice><sic>Linea</sic><corr>Luna</corr></choice> 12 signat quod videris ita fiet sed cave malum. <choice><sic>Linea</sic><corr>Luna</corr></choice> 13 infra 3 dies videbis vel infra quod sompnium. <choice><sic>Linea</sic><corr>Luna</corr></choice> 14 si quid sompniaveris in brevi fiet tempore. <choice><sic>Linea</sic><corr>Luna</corr></choice> 15 sompnium tuum post longum tempus eveniet tibi. <choice><sic>Linea</sic><corr>Luna</corr></choice> 16 post breve tempus fiet. Linea 17 infra 4 dies inveniet  tibi. <choice><sic>Linea</sic><corr>Luna</corr></choice> 18 infra 10 vel 20 vel 30 dies eveniet tibi. <choice><sic>Linea</sic><corr>Luna</corr></choice> 19 infra 9 dies eveniet tibi. <choice><sic>Linea</sic><corr>Luna</corr></choice> 20 non dicas sopmnium tuum usque 3 dies quia certum est. <choice><sic>Linea</sic><corr>Luna</corr></choice> 21 verum est et infra 9 dies eveniet. <choice><sic>Linea</sic><corr>Luna</corr></choice> 22 sompnium ad gaudium perveniet et non reveles. <choice><sic>Linea</sic><corr>Luna</corr></choice> 23 sompnium certum erit rixe concepcio et breviter eveniet. <choice><sic>Linea</sic><corr>Luna</corr></choice> 24 sompnium promittit salutem et lucrum. <choice><sic>Linea</sic><corr>Luna</corr></choice> 25 sompnium secundum metum futurum et infra 4 dies eveniet. <choice><sic>Linea</sic><corr>Luna</corr></choice> 26. certissimum est et infra 9 dies eveniet. <choice><sic>Linea</sic><corr>Luna</corr></choice> 27. sompnim effectum non habet. <choice><sic>Linea</sic><corr>Luna</corr></choice> 28. sicut 26. <choice><sic>Linea</sic><corr>Luna</corr></choice> 29. Sompnium certum est et infra 3 dies eveniet. Sequitur interpretatio sompniorum.
           </p>
           <p xml:id="p3">
            <app>
              <lem wit="Witness_A">
                Arma portare in sompno honorem <choice><abbr>s</abbr><expan>s<ex>ignificat</ex></expan></choice>.
              </lem>
              <rdg wit="Witness_D" />
            </app>
           </p>
           <p xml:id="p4">
            <app>
              <lem wit="Witness_A">
                Arma perdere vel frangere dampnum <choice><abbr>s</abbr><expan>s<ex>ignificat</ex></expan></choice>.
              </lem>
              <rdg wit="Witness_D">
                Arma perdere vel frangere dampnum.
              </rdg>
            </app>
           </p>
           <p xml:id="p5">
            <app>
              <lem wit="Witness_A">
                Aves contra se pugnare <surplus>et</surplus> videre litem <choice><abbr>s</abbr><expan>s<ex>ignificat</ex></expan></choice>.
              </lem>
              <rdg wit="Witness_D" />
            </app>
           </p>
           <p xml:id="p6">
            <app>
              <lem wit="Witness_A">
                Aves apprehendere in sompno lucrum <choice><abbr>s</abbr><expan>s<ex>ignificat</ex></expan></choice>.
              </lem>
              <rdg wit="Witness_D">
                Aves apprehendere lucrum <choice><abbr>s</abbr><expan>s<ex>ignificat</ex></expan></choice>.
              </rdg>
            </app>
           </p>
           <p xml:id="p7">
             <app>
               <lem wit="Witness_A">
                Agnos videre in sompnis consolacionem <choice><abbr>os</abbr><expan>os<ex>tendit</ex></expan></choice>.
               </lem>
               <rdg wit="Witness_D">
                Agnos ut edes habere consolacionem <choice><abbr>s</abbr><expan>s<ex>ignificat</ex></expan></choice>.
               </rdg>
            </app>
           </p>
         </div>
         <div xml:lang="cze" type="translation">
            <p ana="#p1">
              Zde začínají výklady snů, které složil prorok <persName ref="#Person_Daniel">Daniel</persName> v <placeName ref="#Place_Babylon">Babyloně</placeName> za dnů vlády <persName ref="#Person_Nebuchadnezzar">Nabukadnezara</persName>. Všichni lidé totiž vyprávěli sny, které viděli, <persName ref="#Person_Daniel">Danielovi</persName>, aby je <rs type="person" ref="#Person_Daniel">prorok</rs> vyložil jako kdysi v <ref cRef="Gn 41" decls="#biblicalCitations">genesis XI</ref> <persName ref="#Person_Joseph">Josef</persName> <persName ref="#Person_Pharaoh">faraonovi</persName>. Tento <persName ref="#Person_Daniel">Daniel</persName>, odveden ze svatého města <placeName ref="#Place_Jerusalem">Jeruzaléma</placeName> do <placeName ref="#Place_Babylon">Babylonu</placeName>, ukazuje, které sny jsou pravdivé nebo za kolik dní se pravdivými stanou nebo, které dny není nutno sledovat.
            </p>
            <p ana="#p2">
              Den první, cokoliv uvidíš, <supplied reason="translation">[způsobí]</supplied> radost. Den druhý, nezatěžuj tím svou duší, protože nic neznamená. Den 3.,4.,5. sen se brzy vyplní tak a bude nebo se ti vyjeví jeho význam. Den 6., 7., sen uchovávej v tajnosti, proto jej nikomu neříkej, ale modli se k Bohu. Den 8.,9., cokoliv uvidíš jistě se stane. Den 10., snem se netrap, protože se nevyplní. Den 11., sen se vyplní do čtyř dnů. Den 12., to, co jsi viděl se stane, ale vyvaruj se zlého. Den 13., do tří dnů uvidíš, to, co ve snu. Den 14., jestliže se ti něco zdálo, tak se to vyplní v krátké čase. Den 15., tvůj sen se ti vyplní za dlouhou dobu. Den 16., po krátkém čase se vyplní. Den 17., zjistíš do čtyři dny. Den 18. do deset nebo dvacet nebo třicet dní se ti vyplní. Den 19. do devíti dnů se ti naplní. Den 20., svůj sen nikomu neříkej po tři dny, protože je jistý. Den 21. je pravdivý a do 9 dní se splní. Den 22. sen způsobí radost a nesděluj ho nikomu. Řádek 23. sen je skutečně násilné podstaty a brzy se stane. Řádek 24., sen je příslibem zdraví a bohatství. Řádek 25., sen je založen na budoucí obavě a do čtyř dnů se vyplní. Řádek 26. je velmi jistý a stane se do devíti dnů. Řádek 27., sen nemá žádný účinek. Řádek 28. je stejný jako řádek 26. Den 29. sen je jistý a stane se do tří dnů. Následuje výklad snů.
            </p>
            <p ana="p3">
             <app>
               <lem wit="Witness_A">
                Nosit zbraně ve snu značí slávu.
               </lem>
               <rdg wit="Witness_D" />
             </app>
            </p>
            <p ana="p4">
             <app>
               <lem wit="Witness_A">
                  Ztratit nebo zničit zbraně ve snu značí újmu.
               </lem>
               <rdg wit="Witness_D">
                 Ztratit nebo zničit zbraně: újma.
               </rdg>
             </app>
            </p>
            <p ana="p5">
             <app>
               <lem wit="Witness_A">
                Vidět proti sobě bojovat ptáky značí hádku.
               </lem>
               <rdg wit="Witness_D" />
             </app>
            </p>
            <p ana="p6">
             <app>
               <lem wit="Witness_A">
                 Lapat ptáky ve snu značí zisk.
               </lem>
               <rdg wit="Witness_D">
                 Lapat ptáky značí zisk.
               </rdg>
             </app>
            </p>
            <p ana="p7">
              <app>
                <lem wit="Witness_A">
                  Vidět jehňata ve snu značí úlevu z neštěstí.
                </lem>
                <rdg wit="Witness_D">
                  Mít jehňata značí úlevu.
                </rdg>
             </app>
            </p>
         </div>
      </body>
    </text>
</TEI>
```