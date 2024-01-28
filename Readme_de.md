# Joomla Entwicklungsstack

## Einführung

Der Joomla Entwicklungsstack ist eine umfassende Docker-Compose-Umgebung, die speziell für die Entwicklung, das Debugging und das Testen von Joomla-Websites entwickelt wurde. Diese Umgebung stellt eine vollständige Suite von Tools und Diensten zur Verfügung, um Joomla-Webentwicklung zu erleichtern und sicherzustellen, dass Ihre Projekte reibungslos funktionieren.

### Hauptfunktionen und Features

Unser Joomla Entwicklungsstack bietet eine Vielzahl von Funktionen und Features, darunter:

- **Entwicklungsumgebung**: Docker-Compose-basierte Umgebung für Joomla-Webentwicklung.
- **Debugging-Unterstützung**: Integriertes Xdebug für einfaches Debuggen von Joomla-Anwendungen.
- **Unit Testing**: Verwenden Sie PHPUnit zum Schreiben und Ausführen von Unit-Tests.
- **Selenium-Tests**: Automatisieren Sie Browser-Tests für Ihre Joomla-Websites mit Selenium und WebDriver.
- **Mailhog Debugging**: Erfassen und Debuggen ausgehender E-Mails mit Mailhog.
- **phpMyAdmin**: Einfacher Zugriff auf die Datenbank zur Verwaltung von Datenbankschemata und -inhalten.
- **Nginx-Proxy**: Zentrale Verwaltung der Umgebung und einfacher Zugriff auf Dienste.

# Schnellstart-Anleitung

## 1. Anpassen der `.env`-Datei

Die `.env`-Datei enthält wichtige Konfigurationsvariablen für Ihr Projekt. Passen Sie die folgenden Variablen an, um Ihre Joomla-Entwicklungsumgebung zu konfigurieren:

- `PROJECT_NAME`: Geben Sie den Namen Ihres Projekts an.
- `MYSQL_ROOT_PASSWORD`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE`: Legen Sie die MySQL-Datenbankzugangsdaten fest.
- `MYSQL_PREFIX`: Legen Sie den Präfix für die Joomla-Datenbanktabellen fest.
- `JOOMLA_SECRET`: Setzen Sie das Joomla-Geheimnis für sichere Sitzungen.
- `MAIL_FROM`, `MAIL_FROM_NAME`: Konfigurieren Sie die E-Mail-Parameter für Ihre Joomla-Website.

## 2. Joomla-Website hinzufügen

Kopieren Sie Ihre bestehende Joomla-Website in das Verzeichnis `html` in Ihrem Projektordner. Stellen Sie sicher, dass alle Joomla-Dateien und -Ordner korrekt in diesem Verzeichnis platziert sind.

## 3. Datenbank-Dump als ZIP-Datei hinzufügen

Wenn Sie einen Datenbank-Dump haben, packen Sie ihn in eine ZIP-Datei, z.B., `backup.zip`. Legen Sie die ZIP-Datei im Verzeichnis `/config/sql/init` ab. Docker wird die ZIP-Datei entpacken und den Datenbank-Dump verwenden, um die Datenbank beim Starten des Projekts zu initialisieren.

## 4. Anpassen des Nginx-Proxys (optional)

Wenn Sie spezielle Anforderungen für Ihren Nginx-Proxy haben oder eine bestimmte Konfiguration benötigen, passen Sie die Dateien im `config/nginx`-Verzeichnis an. Stellen Sie sicher, dass der Nginx-Proxy entsprechend Ihren Bedürfnissen konfiguriert ist.

## 5. Projekt starten

Führen Sie den folgenden Befehl in Ihrem Projektordner aus, um die Entwicklungsumgebung zu starten:

```bash
docker-compose up -d
```

Dieser Befehl erstellt und startet alle Container gemäß der in Ihrer `docker-compose.yaml`-Datei definierten Konfiguration.

## 6. Zum `phpdev`-Container wechseln (optional)

Nachdem das Projekt gestartet wurde, können Sie zum `phpdev`-Container wechseln, um Ihre Joomla-Entwicklungsarbeit zu beginnen. Sie können den Container auf verschiedene Weisen öffnen:

### Option 1: Wechseln Sie mit dem integrierten Terminal

Öffnen Sie ein Terminal in Visual Studio Code und führen Sie den folgenden Befehl aus:

```bash
docker-compose exec phpdev bash
```

### Option 2: Wechseln Sie über die Docker-Erweiterung

1. Klicken Sie auf das Docker-Symbol in der linken Seitenleiste von VSCode.
2. Suchen Sie den Container mit dem Namen `phpdev` und klicken Sie darauf.
3. Klicken Sie auf "Attach Shell" oder "Attach Visual Studio Code", um eine integrierte Terminal- oder VSCode-Instanz im Container zu öffnen.

Sie befinden sich jetzt im `phpdev`-Container und können mit der Entwicklung Ihrer Joomla-Website beginnen.

---

# Weitere Dokumenationen

- [Dockerfile Entwicklugnscontainer](doc/Readme_Dockerfile.md)
- [Nettools](doc/Readme_Nettools.md)

# ToDo
- Dokumentation überarbeiten.
- Option für zusätzlichen Reverse Proxy dokumentieren bzw. Auswahl automatisieren.
- Skript zum automatischen Laden einer Live-Version einer Webseite über SSH (Dateien und DB).
