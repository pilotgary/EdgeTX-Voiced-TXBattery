Ich habe KI-basierte Übersetzungen dieses Dokuments erstellt für: 🇬🇧&nbsp;**[English](README.md)** · 🇪🇸&nbsp;**[Español](README.es.md)** · 🇫🇷&nbsp;**[Français](README.fr.md)**. Fehler korrigiere ich gerne.

# EdgeTX-Voiced-TXBattery

Dies ist ein kleines Lua-Skript für EdgeTX, das den Akkustand des Senders als Prozentwert ansagt.  

Es entstand, nachdem ich viele Bench-Tests für ein iNav-Setup durchgeführt hatte und dann beim ersten Flug der Alarm für niedrigen Akkustand ausgelöst wurde.

Ich lasse es gern beim Entschärfen (Disarm) auslösen, damit ich am Ende des Flugs weiß, wie viel Akkukapazität für den nächsten Flug übrig ist. Außerdem gibt es beim Einschalten des Senders eine Ansage.

## Funktionsweise

Wenn das Skript ausgelöst wird, liest es die Akkuspannung des Senders und berechnet anhand der in der Funke konfigurierten minimalen und maximalen Akkuspannung einen Prozentwert. Das Ergebnis wird gerundet und auf 0–100 % begrenzt, der Prozentwert wird angesagt, und unter 10 % wird eine Warnung für niedrigen Akkustand abgespielt. Ist die Spannung nicht verfügbar, wird eine entsprechende Ansage („nicht verfügbar“) abgespielt.

## Installation

1. Lade dieses Repository herunter oder klone es und verbinde dann die SD-Karte deines Senders mit deinem Computer (oder greife über den USB-Massenspeichermodus darauf zu).
2. Kopiere `SCRIPTS/FUNCTIONS/txbatpc.lua` in den gleichen Ordner auf der SD-Karte, sodass der endgültige Pfad lautet:
   `SCRIPTS/FUNCTIONS/txbatpc.lua`
3. Kopiere den Ordner `SOUNDS/en/SCRIPTS/TXBATPC` aus diesem Repository an die entsprechende Stelle auf der SD-Karte. Die Sounddateien sollten dann hier liegen:
   `SOUNDS/en/SCRIPTS/TXBATPC/`
   Lass Ordnerstruktur und Dateinamen unverändert. Die Audiodateien werden für die gesprochene Akkuansage und die Warnung bei niedrigem Akkustand verwendet.
4. Wirf die SD-Karte sicher aus (falls zutreffend) und starte den Sender neu oder aktualisiere den Inhalt seiner SD-Karte.
5. Füge in den **Spezialfunktionen** deines Modells eine Funktion hinzu, die das Lua-Skript `txbatpc` ausführt. Wähle den Schalter bzw. die Schalterposition, stelle das Wiederholungs-/Auslöseverhalten auf x1 und setze das Häkchen bei „Aktiv“.

**HINWEIS: Wenn die Sounddateien beim Aktivieren in einer Endlosschleife abgespielt werden, schalte den Sender aus und wieder ein; danach sollte alles einwandfrei funktionieren.**

## Alternative Sprachdateien

Die mitgelieferten Sounddateien sind englisch und nutzen die Stimme Emily (Irland) mit 20 % Beschleunigung. Sie wurde als beste Entsprechung zu den von EdgeTX mitgelieferten Sounddateien gewählt. Wenn du Alternativen erstellen möchtest, empfehle ich Vox-Pack (https://github.com/ritchy-lab/Vox-Pack) 🇬🇧&nbsp;**[English&nbsp;version](https://github.com/ritchy-lab/Vox-Pack/blob/main/README.en.md)** · 🇫🇷 **[Version française](https://github.com/ritchy-lab/Vox-Pack/blob/main/README.md)** . 🇩🇪&nbsp;**[Deutsche&nbsp;Fassung](https://github.com/ritchy-lab/Vox-Pack/blob/main/README.de.md)**

### Englisch

So erstellst du neue Sprachdateien:

1. Importiere die Datei „en.csv“ aus dem Ordner csv in Vox-Pack, indem du oben links auf das Menüsymbol und dann auf „Import a list...“ klickst.
<img width="817" height="429" alt="image" src="https://github.com/user-attachments/assets/c264e993-5362-4151-b1dc-5df677b62497" />


2. Wähle die neue Stimme und die Geschwindigkeit.
3. Klicke auf die Schaltfläche „Let's Go“ und wähle den Zielordner.

Die drei Sprachdateien werden im angegebenen Ordner erzeugt. Kopiere sie in den Ordner SOUNDS/en/SCRIPTS/TXBATPC/ auf deiner Funke.

### Andere Sprachen

Ich habe mit KI Übersetzungen für Französisch, Deutsch und Spanisch erstellt. Sie liegen in den entsprechenden Pfaden im Ordner SOUNDS. Ich kann nicht für die Qualität der Übersetzungen garantieren. Bitte eröffne ein Issue mit einer besseren Übersetzung, deiner bevorzugten Stimme oder Geschwindigkeit.

So erstellst du Sounddateien in einer anderen Sprache:
1. Speichere en.csv unter dem neuen Ländercode, z. B. de.csv für Deutsch.
2. Bearbeite die neue Datei und ersetze die Textzeichenfolgen durch die gewünschten Übersetzungen. Ändere die Dateinamen nicht.
3. Importiere die neue csv-Datei in Vox-Pack.
4. Wähle die neue Stimme und die Geschwindigkeit.
5. Klicke auf die Schaltfläche „Let's Go“ und wähle den Zielordner.
6. Kopiere die neuen wav-Dateien in den Ordner SOUNDS/<dein Sprachcode>/SCRIPTS/TXBATPC/ auf deiner Funke.

## Fehlerbehebung bei fehlenden Sprachdateien

- Vergewissere dich, dass die Sounddateien auf der SD-Karte unter `SOUNDS/en/SCRIPTS/TXBATPC/` liegen und dass Ordner und Dateinamen unverändert sind.
- Das Skript prüft zuerst den Ordner für die in der Funke eingestellte Sprachausgabe. Wird dort eine Sounddatei nicht gefunden, greift es auf die englische Datei in `SOUNDS/en/SCRIPTS/TXBATPC/` zurück.
- Das Skript kann den Prozentwert weiterhin über das `playNumber` von EdgeTX ansagen; die benutzerdefinierten Ansagen und die Warnung bei niedrigem Akkustand benötigen jedoch die zugehörigen WAV-Dateien.
