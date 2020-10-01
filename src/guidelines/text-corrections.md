# Text corrections
Sometimes it is needed to mark changes that are differentiating readings from each other, these differences are usually made of:
+ Abbreviations
+ Scribal interventions: deletions, additions and substitutions
+ Normalisation: `<sic>` and `<corr>`, `<orig>` and `<reg>`
+ Modifications by the editor: `<supplied>`, `<surplus>`
+ Difficult readings and missing parts: `<unclear>`, `<damage>`

### Choice
```xml
<choice></choice>
```
The `choice` element groups a number of alternative encodings for the same point in a text. This element is often used for abbreviations and normalisations.

## Abbreviations
```xml{2}
<choice>
  <abbr>Arthemandꝰ</abbr>
</choice>
```
To mark abbreviation in the text the `abbr` element can be used. It can stand alone or inside the `choice` element. The `choice`
element must be used if expansion of the abbreviation is provided.

#### Expansion
```xml{3}
<choice>
  <abbr>Arthemandꝰ</abbr>
  <expan>Arthemand<ex>us<ex></expan>
</choice>
```
Sometimes, it is desirable to expand the abbreviation, that can be achieved by using the `expan` element. However, the element can not stand alone, and the
abbreviation must be defined inside the `choice` group within the `abbr` element. The additional element `ex` contains a sequence of letters added by an editor or transcriber when expanding an abbreviation. Can be omitted.

## Scribal interventions

### Deletions
```xml
Ridere <del>aut ridentes</del> viderit: tristitiam significat.
```
Contains a letter, word, or passage deleted, marked as deleted, or otherwise indicated as superfluous or spurious in the copy text by an author, scribe, or a previous annotator or corrector. The part _aut ridentes_ was crossed out in the original text, thus it is marked as deletion.

### Additions
```xml
Ridere <add place="above">aut ridentes</add> viderit: tristitiam significat.
```
Contains letters, words, or phrases inserted in the source text by an author, scribe, or a previous annotator or corrector.
The attribute `place` must be used to provide additional information of the placement.

| Place | Description
| :- | :-
| above | The addition is above the word or line.
| below | The addition is below the word or line.
| lmargin | The addition is in the left margin.
| rmargin | The addition is in the right margin.
| interlinear | The addition is interlinear.

### Substitutions
```xml{1,6}
<subst>
  Ridere aut ridentes
  <del>aut</del>
  <add>vel</add>
  viderit: tristitiam significat.
</subst>
```
Groups one or more deletions with one or more additions when the combination is to be regarded as a single intervention in the text.

## Normalisation and regularization
### Correcting mistakes
Sometimes an apparently inaccurate or incorrect text can be found in the manuscript and it is up to us if we would like to correct it. For that purpose there are following elements.
#### Marking inacurrate text
```xml{3}
Annolos vel armillas dare videre vel capere dolorem
<choice>
  <sic>dona</sic>
  <corr>dolorem</corr>
</choice>
significat.
```
To mark the normalisation inside our file we can simply use the `sic` element alone. It should contain the reproduced text although apparently incorrect or inaccurate. We can also suggest correction and for that purpose the element `corr` should be used, see below.

::: warning Important
When the correction is suggested, both elements `sic` and `corr` must be wrapped inside the `choice` element as can be seen in examples.
:::

#### Suggesting correction
```xml{4}
Annolos vel armillas dare videre vel capere dolorem
<choice>
  <sic>dona</sic>
  <corr>dolorem</corr>
</choice>
significat.
```
The element `corr` contains the correct form of a passage apparently erroneous in the copy text.

### Regularization of the text
In some cases, the regularization might be usefull and for that purpose can be used following elements.
#### Marking original reading
```xml{2}
The <choice>
<orig>tragicall</orig>
<reg>tragical</reg>
</choice>...
```
Contains a reading which is marked as following the original, rather than being normalized or corrected.

#### Regularization
```xml{3}
The <choice>
<orig>tragicall</orig>
<reg>tragical</reg>
</choice>...
```
Contains a reading which has been regularized or normalized in some sense.

## Modification by the editor
### Supplied
```xml
I <supplied reason="omitted-in-original">was</supplied> lazy when I wrote this text.
```
Signifies text supplied by the transcriber or editor for any reason; for example because the original cannot be read due to physical damage, or because of an obvious omission by the author or scribe. In the above example the word _was_ was missing.

| Reasons | Description
| :- | :-
| omitted-in-original | The word was omitted in the original text.
| overbinding | The text was placed in overbiding.
| faded-ink | The word was missing due to the faded ink.
| lost-folio | The text was missing due to the lost folio, but was found somewhere else.

::: tip
Note that whitespaces are separators, that is why are the phrases describing the reason hyphenated.
:::

### Redudant text
```xml
Cum cane ludere <surplus>bonum</surplus> bonum tempus significat.
```
The element `surplus` marks text present in the source which the editor believes to be superfluous or redundant.

## Difficult readings
### Damaged text is illegible, no text is supplied
```xml
<lb break="no"/>mini et replete terram, et subic<gap reason="cut-out" extent="9 words"/>
<lb break="no"/>bus maris, et uolatilibus celi <gap reason="cut-out" extent="4 words"/>
```
The element `gap` indicates a point where material has been omitted in a transcription, whether for editorial reasons described in the TEI header, as part of sampling practice, or because the material is illegible, invisible, or inaudible. As can be seen there are two attributes `reason` and `extent`. The `reason` attribute contains reason why there is gap, see table of sample reasons. The `exten` attribute describes the expected length of the missing part.

| Reason | Description
| :- | :-
| cut-out | the part of the text was cut out
| irrelevant | the part of the text was irrelevant
| cancelled | the rest of the text has not been completed
| fire | the part of the text was damaged by fire
| faded | the text is faded

### Damaged text is illegible, but text is supplied
#### Marking damaged part
```xml{1,3}
I <damage reason="fire" extent="1 word">
  <supplied reason="burnt-hole-in-original">was</supplied>
</damage> lazy when I wrote this text.
```
Contains an area of damage to the text witness. Similarly as in case of `gap` element there are attributes `reason` and `extent`, see [gap](#damaged-text-is-illegible-no-text-is-supplied).

#### Supplying editor's text
```xml{2}
I <damage reason="fire" extent="1 word">
  <supplied reason="burnt-hole-in-original">was</supplied>
</damage> lazy when I wrote this text.
```
Signifies text supplied by the transcriber or editor for any reason; for example: because the original cannot be read due to physical damage, or because of an obvious omission by the author or scribe. Similarly, as the forementioned elements the `supplied` element has attribute `reason`. In this case short description of the reason should be provided.

::: tip
Note that whitespaces are separators, that is why the phrases describing the reason are hyphenated.
:::

### Damaged text is partially legible
When the text is partially legible, following scheme should be used:
+ Use `damage` or `del` elements to mark up the damaged or deleted parts - [see damage](#damaged-text-is-illegible-but-text-is-supplied), [deletion](#deletions)
+ use `gap` to mark up the illegible part(s), or `supplied` if you wish to supply text - [see gap](#damaged-text-is-illegible-no-text-is-supplied)
+ use `unclear` to mark up the parts of the text which cannot be transcribed with perfect confidence.

#### Marking the unclear text
```xml{3}
… peruenit. <del>
<gap reason=”deletion” extent=”4 or 5 words”/>
<unclear reason="blackened-out" cert=”middle”>sunt</unclear>
</del> Tertio …
```
Contains a word, phrase, or passage which cannot be transcribed with certainty because it is illegible or inaudible in the source. The attribute `reason` should provide short indication of why the material is not readable, [see the reasons table](#damaged-text-is-illegible-no-text-is-supplied). The `cert` signifies the degree of certainty associated with the intervention or interpretation.

| Certainity | Degree of certainity
| :- | -:
| high | 70-100%
| middle | 40-70%
| low | 10-40%
| uncertain | 0-10%

### Damaged text is perfectly legible
There is no need to mark it up. Use `del` or `damage`.
