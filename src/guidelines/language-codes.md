# Language abbreviations

The `xml:lang` attribute must contain a language tag in the **BCP 47** format, as the TEI requires. For most languages this is the shortest ISO 639 code (two letters where one exists, e.g. `la`, `cs`). Old and Middle Czech have no ISO code, so they use private-use tags (`-x-`). The LINDAT schema accepts only the codes in this table.

| Language | Code | Previously used | Note |
|:-|:-:|:-:|:- |
| Czech | cs | cze |  |
| Czech, Middle | cs-x-middle | czm | ca. 1500-1700 |
| Czech, Old | cs-x-old | czo | ca. 1200-1500 |
| English | en | eng |  |
| English, Middle | enm | enm | ca. 1100-1500 |
| English, Old | ang | ang | ca. 450-1100 |
| French | fr | fre |  |
| French, Middle | frm | frm | ca. 1400-1600 |
| French, Old | fro | fro | ca. 842 - 1400 |
| German | de | ger | |
| German, Middle High | gmh | gmh | ca. 1050-1500 |
| German, Old High | goh | goh | ca.  750-1050 |
| Greek, Ancient | grc | grc | to 1453 |
| Greek, Modern | el | gre | after 1453 |
| Latin | la | lat |  |

::: warning Changed in version 2.0.0
Files encoded with the earlier codes (`cze`, `lat`, `eng`…) have to be converted to the codes above, otherwise they will not pass the schema. Note that `czo` is not Old Czech: it is the ISO code for Min Zhong Chinese.
:::
