# Translations

To provide translation with the original latin text the document's body should be divided into two parts, the original and translation. For that purpose
`div` elements should be used as shown in the example below. The `type` attribute and the `xml:lang` are considered mandatory as they provide information
about the text contained inside. For translations should be `type` set to value `translation` and for the original text to `original`. The `xml:lang` attribute
must contain valida ISO-639 language abbreviation, [see the table](./language-codes).

```xml{7-10}
<text>
  <body>
    <div type="original" xml:lang="lat">
    <p xml:id="p1">Arma portare in sompno honorem significat</p>
    <!-- and so on... -->
    </div>
    <div type="translation" xml:lang="cze">
      <p ana="#p1">Nosit zbraně ve snu značí slávu</p>
      <!-- a tak dále... -->
    </div>
  </body>
</text>
```

::: warning Important
The translation **MUST** always be separated from the original text.
:::

::: tip
Same rules as for the original text can be applied for translation.
:::