# Joomla Entwicklungsumgebung Docker-Image

Diese Readme beschreibt das Docker-Image, das speziell für die Entwicklung von Joomla-Erweiterungen konzipiert wurde. Das Image enthält eine Vielzahl von Tools, die für die Joomla-Entwicklung, das Testen und die Fehlerbehebung nützlich sind.

## Enthaltene Tools und Dienste

### Basis-Image

- **Joomla mit PHP 8 und Apache**: Verwendet das offizielle Joomla-Image `joomla:4.3.3-php8.0-apache` als Basis.

### Git

- **Git**: Installiert und konfiguriert Git zur Versionskontrolle. Sie müssen die Umgebungsvariablen `GIT_NAME` und `GIT_EMAIL` bereitstellen, um die globalen Git-Konfigurationen zu setzen.
  - [Git Dokumentation](https://git-scm.com/doc)

### Netzwerk-Tools

- **Allgemeine Tools**: `zip`, `wget`, `gnupg2`, `nano`, `net-tools` für verschiedene Netzwerk- und Dateimanagement-Aufgaben.
- **Netzwerk-Diagnose**: `iputils-ping`, `telnet`, `curl`, `netcat` zum Testen und Debuggen von Netzwerkverbindungen.
- Mehr dazu unter [Readme_Nettools](Readme_Nettools.md)

### Webentwicklung und Testing

- **Python 3 & Pip**: Installiert Python und Pip für Skripting und Tool-Management.
- **Google Chrome & Selenium**: Chrome wird für das Web-Testing installiert. Selenium, ein Tool für automatisierte Webtests, wird über Pip installiert.
  - [Selenium Dokumentation](https://www.selenium.dev/documentation/en/)

### Debugging Tools

- **Xdebug**: Ein PHP-Debugger, der bei der Fehlersuche in PHP-Anwendungen hilft.
  - [Xdebug Dokumentation](https://xdebug.org/docs)

### Composer & PHPUnit

- **Composer**: Ein Tool für die Verwaltung von PHP-Abhängigkeiten.
  - [Composer Dokumentation](https://getcomposer.org/doc/)
- **PHPUnit**: Ein Unit-Testing-Framework für PHP.
  - [PHPUnit Dokumentation](https://phpunit.de/documentation.html)

### PHP_CodeSniffer & Joomla Coding Standards

- **PHP_CodeSniffer**: Ein Tool, das hilft, PHP-, CSS- und JS-Dateien anhand von definierten Codierungsstandards zu überprüfen.
- **Joomla Coding Standards**: Eine Sammlung von Codierungsstandards speziell für Joomla.
  - [PHP_CodeSniffer Dokumentation](https://github.com/squizlabs/PHP_CodeSniffer)
  - [Joomla Coding Standards](https://developer.joomla.org/coding-standards.html)

## Volumes

- **/var/www/html/**: Joomla-Website-Verzeichnis.
- **/var/log/apache2/**: Apache-Log-Dateien.
- **/root**: Root-Verzeichnis für Benutzerkonfigurationen und -daten.

## Start-Skript

- Ein Start-Skript (`start.sh`) wird hinzugefügt und ausgeführt, um den Container zu initialisieren. Stellen Sie sicher, dass dieses Skript die notwendigen Befehle zur Initialisierung des Apache-Servers und anderer erforderlicher Dienste enthält.

## Anwendung

Um das Image zu verwenden, bauen Sie es mit dem bereitgestellten Dockerfile und starten Sie den Container. Stellen Sie sicher, dass Sie alle notwendigen Umgebungsvariablen setzen, insbesondere für die Git-Konfiguration.

### Image Bauen

Führen Sie folgenden Befehl im Verzeichnis des Dockerfiles aus:

```bash
docker build -t joomla-dev .
```

### Container Starten

Starten Sie Ihren Container mit:

```bash
docker run -d -p 80:80 joomla-dev
```

Passen Sie den Befehl entsprechend Ihren Bedürfnissen an, zum Beispiel durch Einbinden zusätzlicher Volumes oder Port-Weiterleitungen.

## Hinweise

- Stellen Sie sicher, dass Sie die Umgebungsvariablen für Git (`GIT_NAME` und `GIT_EMAIL`) setzen, bevor Sie das Image bauen.
- Passen Sie das Start-Skript (`start.sh`) an Ihre spezifischen Anforderungen an.
- Überprüfen Sie regelmäßig auf Updates für die in diesem Image enthaltenen Tools, um von den neuesten Funktionen und Sicherheitsupdates zu profitieren.    
