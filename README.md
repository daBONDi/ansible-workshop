# ansible-workshop

Tages Workshop über Ansible für Entwickler/Techniker

## Anforderungen

**Visual Studio Code** mit folgenden Plugins

- haaaad.ansible

** WinSCP**

- mit WinSCP in PATH Variable für mirror.bat Script

### Konfiguration von mirror.bat

### Putty

SSH Putty key: /vagrant/ssh/putty.workshop.priv.ppk

### SSH Client

```bash
ssh -i vagrant/ssh/workshop.key vagrant@172.16.233.10
```

## Ordner

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
