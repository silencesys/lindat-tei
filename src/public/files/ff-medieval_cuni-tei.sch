<?xml version="1.0" encoding="UTF-8"?>
<!--
  LINDAT / Medieval CUNI TEI rules that a RELAX NG schema cannot express.
  Source: https://lindat.coders.tools/guidelines/
  role="error"   = the guidelines say "must" / "mandatory" / "required"
  role="warning" = the guidelines say "recommended" / "should", or the rule is only shown in examples
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>LINDAT TEI rules</title>
  <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

  <let name="vulgata" value="('Gn','Ex','Lv','Nm','Dt','Ios','Idc','Rt','1Rg','2Rg','1Sm','2Sm','3Rg','4Rg','1Par','2Par','1Esr','2Esr','Est','Iob','Ps','Prv','Ecl','Ct','Is','Ier','Lam','Ez','Dn','Os','Ioel','Am','Abd','Ion','Mi','Na','Abk','So','Agg','Za','Mal','Tb','Idt','Sap','Sir','Bar','Da','1Mcc','2Mcc','Mt','Mc','Lc','Io','Act','Rm','1Cor','2Cor','Gal','Eph','Phil','Col','1Th','2Th','1Tim','2Tim','Tit','Phlm','Hbr','Iac','1Pt','2Pt','1Io','2Io','3Io','Iud','Apc','OrMan','3Esr','4Esr','Laod')"/>
  <let name="ids" value="//@xml:id"/>

  <!-- ================= TEI Header ================= -->
  <pattern id="header-title">
    <rule context="tei:titleStmt/tei:title">
      <assert test="@xml:lang" role="error">The title in titleStmt needs @xml:lang.</assert>
      <assert test="every $l in @xml:lang satisfies count(../tei:title[@xml:lang = $l]) = 1" role="warning">Each title in titleStmt should be in a different language.</assert>
    </rule>
  </pattern>

  <pattern id="header-publication">
    <rule context="tei:publicationStmt">
      <assert test="tei:publisher" role="error">publicationStmt needs a publisher.</assert>
      <assert test="tei:pubPlace" role="error">publicationStmt needs a pubPlace.</assert>
      <assert test="tei:date" role="error">publicationStmt needs a date.</assert>
    </rule>
    <rule context="tei:publicationStmt/tei:pubPlace">
      <assert test="tei:country" role="error">pubPlace needs a country (English name).</assert>
      <assert test="tei:settlement" role="error">pubPlace needs a settlement (city).</assert>
    </rule>
  </pattern>

  <pattern id="header-dates">
    <rule context="tei:publicationStmt/tei:date">
      <assert test="@when" role="error">The publication date needs @when (YYYY-MM-DD).</assert>
    </rule>
    <rule context="tei:editionStmt//tei:date">
      <assert test="@when" role="warning">Edition dates should carry @when (YYYY-MM-DD).</assert>
    </rule>
  </pattern>

  <pattern id="header-keywords">
    <rule context="tei:textClass//tei:term">
      <assert test="@type = ('genre', 'form')" role="error">Keyword terms need @type="genre" or @type="form".</assert>
      <assert test="@xml:lang" role="error">Keyword terms need @xml:lang.</assert>
      <assert test="every $l in @xml:lang, $t in @type satisfies count(../tei:term[@type = $t][@xml:lang = $l]) = 1" role="warning">Each keyword of the same type should be in a different language.</assert>
    </rule>
  </pattern>

  <pattern id="header-ids">
    <rule context="tei:titleStmt/tei:author[@xml:id]">
      <assert test="starts-with(@xml:id, 'Author_')" role="warning">Author IDs should start with "Author_".</assert>
    </rule>
    <rule context="tei:titleStmt/tei:editor[@xml:id]">
      <assert test="starts-with(@xml:id, 'Editor_')" role="warning">Editor IDs should start with "Editor_".</assert>
    </rule>
    <rule context="tei:editionStmt/tei:edition[@xml:id]">
      <assert test="starts-with(@xml:id, 'Edition_')" role="warning">Edition IDs should start with "Edition_".</assert>
    </rule>
  </pattern>

  <!-- ================= Witness description ================= -->
  <pattern id="witness-identifier">
    <rule context="tei:witness/tei:msDesc/tei:msIdentifier">
      <assert test="tei:country" role="error">msIdentifier needs a country.</assert>
      <assert test="tei:settlement" role="error">msIdentifier needs a settlement.</assert>
      <assert test="tei:institution" role="error">msIdentifier needs an institution.</assert>
      <assert test="tei:collection" role="warning">msIdentifier should name a collection, if the manuscript belongs to one.</assert>
      <assert test="tei:idno" role="error">msIdentifier needs an idno.</assert>
    </rule>
  </pattern>

  <pattern id="witness-items">
    <rule context="tei:msItem/tei:title">
      <assert test="@xml:lang" role="error">The title of an msItem needs @xml:lang.</assert>
    </rule>
    <rule context="tei:handNote">
      <assert test="tei:p" role="error">The description of a hand goes inside a p.</assert>
      <assert test="starts-with(@xml:id, 'Hand_')" role="warning">Hand IDs should start with "Hand_".</assert>
    </rule>
    <rule context="tei:supportDesc//tei:material | tei:objectDesc//tei:material">
      <assert test="lower-case(normalize-space(.)) = ('parchment', 'paper', 'calfskin', 'goatskin', 'mixed')" role="warning">material should be one of: parchment, paper, calfskin, goatskin, mixed.</assert>
    </rule>
  </pattern>

  <!-- ================= People, places, organisations ================= -->
  <pattern id="entities">
    <rule context="tei:listPerson/tei:person">
      <assert test="@xml:id" role="error">Every person needs @xml:id.</assert>
      <assert test="not(@xml:id) or starts-with(@xml:id, 'Person_')" role="warning">Person IDs should start with "Person_".</assert>
    </rule>
    <rule context="tei:listPlace/tei:place">
      <assert test="@xml:id" role="error">Every place needs @xml:id.</assert>
      <assert test="not(@xml:id) or starts-with(@xml:id, 'Place_')" role="warning">Place IDs should start with "Place_".</assert>
    </rule>
    <rule context="tei:listOrg/tei:org">
      <assert test="@xml:id" role="error">Every organisation needs @xml:id.</assert>
      <assert test="not(@xml:id) or starts-with(@xml:id, 'Org_')" role="warning">Organisation IDs should start with "Org_".</assert>
    </rule>
  </pattern>

  <pattern id="entity-names">
    <rule context="tei:place/tei:placeName | tei:place/tei:geogName | tei:org/tei:orgName">
      <assert test="@xml:lang" role="error"><name/> in the list of places or organisations needs @xml:lang.</assert>
    </rule>
    <rule context="tei:place/tei:country | tei:place/tei:location/tei:country">
      <assert test="@key" role="warning">country should carry @key with a country code, e.g. key="CZ".</assert>
    </rule>
    <rule context="tei:geo">
      <assert test="matches(normalize-space(.), '^-?[0-9]+(\.[0-9]+)? -?[0-9]+(\.[0-9]+)?$')" role="error">geo holds latitude and longitude separated by a space, e.g. "50.0875 14.4214".</assert>
    </rule>
  </pattern>

  <!-- ================= Bibliography ================= -->
  <pattern id="bibliography">
    <rule context="tei:listBibl/tei:bibl | tei:listBibl/tei:biblStruct">
      <assert test="@xml:id" role="error">Every bibliography entry needs @xml:id.</assert>
      <assert test="@type" role="error">Every bibliography entry needs @type.</assert>
      <assert test="not(@type) or @type = ('monography', 'book', 'article', 'thesis', 'dissertation', 'journal', 'edition')" role="error">@type must be monography, book, article, thesis, dissertation, journal or edition.</assert>
      <assert test="not(@xml:id) or matches(@xml:id, '^[A-Za-z]+_')" role="warning">Bibliography IDs should carry a prefix such as "Bibl_" (a different prefix for each list).</assert>
    </rule>
    <rule context="tei:analytic | tei:monogr">
      <assert test="tei:title" role="error"><name/> must contain a title.</assert>
      <assert test="every $t in tei:title satisfies count(tei:title[@type = $t/@type][@level = $t/@level]) = 1" role="warning">Several titles in one <name/> should differ in @type (main, sub, alt, short, desc).</assert>
    </rule>
  </pattern>

  <!-- ================= Text structure and translations ================= -->
  <pattern id="body-divs">
    <rule context="tei:text/tei:body">
      <assert test="tei:div[@type = 'original']" role="error">The body needs a div with type="original".</assert>
    </rule>
    <rule context="tei:text/tei:body/tei:div">
      <assert test="@type = ('original', 'translation')" role="error">Top-level divs need type="original" or type="translation".</assert>
    </rule>
  </pattern>

  <pattern id="translation-links">
    <rule context="tei:body[tei:div/@type = 'translation']/tei:div[@type = 'original']//tei:p">
      <assert test="@xml:id" role="error">When a translation exists, every paragraph of the original needs @xml:id.</assert>
    </rule>
    <rule context="tei:div[@type = 'translation']//tei:p">
      <assert test="@ana" role="warning">A translated paragraph should point to its original with @ana="#id".</assert>
      <assert test="not(@ana) or (starts-with(@ana, '#') and substring-after(@ana, '#') = $ids)" role="error">@ana must point to an existing paragraph, written with #, e.g. ana="#p1".</assert>
    </rule>
  </pattern>

  <pattern id="dates">
    <rule context="tei:*[@notBefore]">
      <assert test="@notAfter" role="warning">notBefore is expected together with notAfter.</assert>
      <assert test="not(@notAfter) or starts-with(@notBefore, '-') or starts-with(@notAfter, '-') or string(@notBefore) le string(@notAfter)" role="error">notBefore is later than notAfter.</assert>
    </rule>
  </pattern>
  <pattern id="dates-range">
    <rule context="tei:*[@from][not(self::tei:locus)]">
      <assert test="@to" role="warning">from is expected together with to.</assert>
    </rule>
  </pattern>

  <pattern id="pointers">
    <rule context="tei:*[@ref][self::tei:persName or self::tei:placeName or self::tei:orgName or self::tei:name or self::tei:rs]">
      <assert test="every $r in tokenize(normalize-space(@ref), ' ') satisfies (not(starts-with($r, '#')) or substring($r, 2) = $ids)" role="error">@ref points to an ID that does not exist in this file.</assert>
    </rule>
    <rule context="tei:*[@hand]">
      <assert test="every $h in tokenize(normalize-space(@hand), ' ') satisfies (starts-with($h, '#') and substring($h, 2) = //tei:handNote/@xml:id)" role="error">@hand must point to a handNote in the header, written with #, e.g. hand="#Hand_A".</assert>
    </rule>
    <rule context="tei:pb[@source] | tei:lb[@source]">
      <assert test="every $s in tokenize(normalize-space(@source), ' ') satisfies (not(starts-with($s, '#')) or substring($s, 2) = $ids)" role="error">@source points to an ID that does not exist in this file.</assert>
    </rule>
  </pattern>

  <pattern id="segments">
    <rule context="tei:seg[@xml:id]">
      <assert test="concat('#', @xml:id) = //tei:p/@corresp" role="warning">A seg should be described by a p with corresp="#<value-of select="@xml:id"/>".</assert>
    </rule>
  </pattern>

  <!-- ================= Citations and references ================= -->
  <pattern id="citations">
    <rule context="tei:cit">
      <assert test="tei:quote" role="error">A cit must contain a quote. If nothing is quoted, use ref and bibl without cit.</assert>
    </rule>
  </pattern>

  <pattern id="references">
    <rule context="tei:ref[@cRef]">
      <assert test="//tei:refsDecl[@xml:id = 'biblicalCitations']" role="error">Biblical references need refsDecl xml:id="biblicalCitations" in encodingDesc.</assert>
      <assert test="@decls = '#biblicalCitations'" role="warning">Biblical references should carry decls="#biblicalCitations".</assert>
      <assert test="substring-before(concat(normalize-space(@cRef), ' '), ' ') = $vulgata" role="warning">The book should use a Vulgata abbreviation (Gn, Ex, Mt, Io …).</assert>
      <assert test="not(//tei:refsDecl[@xml:id = 'biblicalCitations']/tei:cRefPattern/@matchPattern) or (some $m in //tei:refsDecl[@xml:id = 'biblicalCitations']/tei:cRefPattern/@matchPattern satisfies matches(@cRef, concat('^', $m, '$')))" role="error">@cRef does not match the pattern declared in refsDecl (e.g. "Gn 1:1" for "book chapter:verse").</assert>
    </rule>
    <rule context="tei:ref[@target][starts-with(@target, '#')]">
      <assert test="substring(@target, 2) = $ids" role="error">@target points to an ID that does not exist in this file.</assert>
    </rule>
  </pattern>

  <pattern id="refsdecl">
    <rule context="tei:refsDecl[@xml:id = 'biblicalCitations']">
      <assert test="tei:cRefPattern[@matchPattern and @replacementPattern]" role="error">refsDecl needs a cRefPattern with matchPattern and replacementPattern.</assert>
      <assert test="tei:cRefPattern/tei:p" role="warning">The cRefPattern should contain a p explaining the pattern.</assert>
    </rule>
  </pattern>

  <!-- ================= Critical apparatus ================= -->
  <pattern id="apparatus">
    <rule context="tei:*[@wit]">
      <assert test="every $w in tokenize(normalize-space(@wit), ' ') satisfies (starts-with($w, '#') and substring($w, 2) = //tei:listWit//tei:witness/@xml:id)" role="error">@wit must point to witnesses in listWit, written with #.</assert>
    </rule>
  </pattern>

  <!-- ================= Text corrections ================= -->
  <pattern id="corrections">
    <rule context="tei:expan">
      <assert test="parent::tei:choice[tei:abbr]" role="error">expan must sit inside choice, next to abbr.</assert>
    </rule>
    <rule context="tei:corr">
      <assert test="parent::tei:choice[tei:sic]" role="error">corr must sit inside choice, next to sic.</assert>
    </rule>
    <rule context="tei:reg">
      <assert test="parent::tei:choice[tei:orig]" role="error">reg must sit inside choice, next to orig.</assert>
    </rule>
    <rule context="tei:subst">
      <assert test="tei:del and tei:add" role="error">subst groups at least one del and one add.</assert>
    </rule>
  </pattern>

</schema>
