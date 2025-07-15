# StudIP-ILIAS Style

## Markierung von Änderungen im Code
Um die Änderungen für den StudIP-ILIAS Style übersichtlich zu halten, sollten diese von Kommentaren umschlossen werden:

```
// Stud.IP Skin changes start:
Style Änderung
// Stud.IP Skin changes end
```

## Verwendung der Stud.IP-ILIAS Variablen
Stud.IP-spezifische Variablen finden sich in ```_studip-ilias-variables.scss```.
Diese Datei kann zur Verwendung oben eingebunden werden mit
```
@use "../../../_studip-ilias-variables.scss" as studip;
```
(Dabei die Ebene der aktuellen Datei beachten und den Pfad ggf anpassen.)
Auf die Variablen kann nun mit ```studip.$variablenname``` zugegriffen werden.

## Angepasste Dateien
Die folgenden Dateien wurden für den Skin angepasst:
- 010-settings/_settings_footer.scss
- 010-settings/_settings_header.scss
- 010-settings/_settings_mainbar.scss
- 050-layout/standardpage/_layout_standardpage.scss
- 070-components/UI-framework/Layout/_ui-component_standardpage.scss
- 070-components/UI-framework/MainControls/_ui-component_footer.scss
- 070-components/UI-framework/MainControls/_ui-component_mainbar.scss