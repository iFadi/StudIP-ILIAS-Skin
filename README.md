# StudIP-ILIAS Skin
Dieser Skin wurde für die ILIAS Installation auf [studip.ilias.uni-hannover.de](https://studip.ilias.uni-hannover.de/) entwickelt.

## Version
v1.0.0


## Installation

Um das Skin zu installieren, man geht zur {ILIAS Root} installation, z.B.
`/srv/ilias-studip/ILIAS`

```
cd /srv/ilias-studip/ILIAS/
cd Customizing/global/
```


Falls das Ordner "skin" nicht vorhanden, dann anlegen:

```
mkdir skin
cd skin
```

Nun innerhalb der Skin Ordner werden wir den LUH-Skin installieren, dazu einfach einen git clone ausführen:

`git clone https://github.com/iFadi/StudIP-ILIAS-Skin.git`

Dann den entsprechenden Branch bzw. Tag auschecken.

`git checkout tags/v1.0.0`

bzw. falls man auf dem ilias-8x branch ist, dann kann man einfach git pull machen.

`git pull`


Das war es.

## Für die Implementierung

Less-Dateien anpassen. Danach den Skript 'updateSkin.sh' als root ausführen, um die less-Dateien zu kompilieren.

```sudo ./update-skin.sh```

Dieser Skript benutzt die Systemzeit, um die CSS-Dateien mit eine eindeutige ID zu versehen.
Dieser ID wird an der Hauptdateiname des Skins `StudIP-ILIAS-Style.css` angehängt, um das Neuladen der Skin Änderungen vom Browser zu erzwingen.

Falls in das Produktive-System kein lessc installiert ist, kann der oben genannte Script nicht ausgeführt werden.
Daher ist es vorteilhaft, die kompilierte `StudIP-ILIAS-Style.css` z.B. auf einem Test System, in einem Tag/Skin-Version hinzuzufügen.


## Dieser release wurde auf folgende ILIAS Versionen getestet:
* v8.8

<strong>WICHTIG: Der Skin sollte für jede ILIAS Minor/Major Release auf funktionalität getestet werden.</strong>
