# ansible-workshop

Tages Workshop über Ansible für Entwickler/Techniker

## Anforderungen

**Visual Studio Code** (1.31) mit folgenden Plugins

- haaaad.ansible

**WinSCP**

- Pfad zu WinSCP.EXE in der task.json ändern

**ssh** - Git for Windows

- ssh.exe in der Pfad Variable

## Zum Ansible Controller Verbinden

### Configuration

Datei tasks.json anpassen und folgende Variablen Ändern

- **ANSIBLEHOST**: FQDN zum AWS Ansible Controller Host

### Verbinden

- STRG + SHIFT + P
- Run Tasks
  - Connect to Ansible Controller

## Automatische Dateisyncronisierung über WinSCP

### Configuration

Datei tasks.json anpassen und folgende Variablen Ändern

- **ANSIBLEHOST**: FQDN zum AWS Ansible Controller Host
- **WINSCPEXE**: Vollständiger Pfad zur WinSCP Exe

### Starten der Syncronisation

- STRG + SHIFT + P
- Run Tasks
  - Demos: Automatic Sync Demos Folder
  - Workshop: Automatic Sync Workshop Folder

## Remote Verbindung zu den AWS Instanzen

### Putty

SSH Putty key: /vagrant/ssh/putty.workshop.priv.ppk

## Projektordner

### environment

Ansible Playbook to
  
- Create
- Configure
- Smoketest

all attendant ec2 instances for workshop

### demos

Demo Sourcen für Presentator

### doc

Handout für die Schulungsteilnehmer

### workshop

Alle Sourcen für jeden Übungsschritt

### slides

Präsentation

- Benutzt Reveal.js
- Benötigt Node.js > 4.0
- Start Development

  ```batch
  cd slides
  npm install
  npm start
  ```
- drucken http://localhost:8000/?print-pdf
- Browse http://localhost:8000
