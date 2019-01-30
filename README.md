# ansible-workshop

Ansible Workshop für Antares NetlogiX

## Anforderungen

**Visual Studio Code** mit folgenden Plugins

- haaaad.ansible

https://code.visualstudio.com/

**Vagrant** mindestens in der Version 2.2.3

https://www.vagrantup.com/

**Virtualbox** > 5.2.x

https://www.virtualbox.org/

### Vagrant Boxes vorab runterladen

```bash
  # Benötigte Vagrant Boxen herunterladen
  workshop\vagrant-setup\preseed-box.cmd
```

## Vagrant Demo VM

| Name      | IP             | OS               | Vagrant Box                |
| --------- | -------------- | ---------------- | -------------------------- |
| ansible   | 172.16.233.10  | Debian Stretch64 | debian/stretch64           |
| debian1   | 172.16.233.21  | Debian Stretch64 | debian/stretch64           |
| debian2   | 172.16.233.22  | Debian Stretch64 | debian/stretch64           |
| centos1   | 172.16.233.31  | CentOS 7         | centos/7                   |
| centos2   | 172.16.233.32  | CentOS 7         | centos/7                   |
| win1      | 172.16.233.41  | Debian Stretch64 | StefanScherer/windows_2019 |
| win2      | 172.16.233.42  | Debian Stretch64 | StefanScherer/windows_2019 |

### Benutzung von Vagrant

```bash
# VM starten
vagrant up ansible

# VM herunterfahren
vagrant halt ansible

# Destroy/Delete einer VM
vagrant destroy ansible

# Löschen aller VM's
vagrant destroy

# SSH Verbindung zu Linux VM öffnen
vagrant ssh ansible

# WinRM Verbindung zu Windows VM öffnen
vagrant winrm win1
```

### Putty

SSH Putty key: /vagrant/ssh/putty.workshop.priv.ppk

### SSH Client

```bash
ssh -i vagrant/ssh/workshop.key vagrant@172.16.233.10
```

## Ordner

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