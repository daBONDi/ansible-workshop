# ANX Ansible Workshop

https://ansible-tips-and-tricks.readthedocs.io/en/latest/ansible/commands/

https://de.slideshare.net/bcoca/ansible-config-mgmt

## Vorstellen

- Was ich gemacht habe
- Wo arbeite ich
  - Was ich alles mache
- Wie komm ich dazu
- Was mache ich Privat
  - Github
  - Ansible Windows Group
- Erste mal als Trainer
- Wer hat Ansible Erfahrung

## Übersicht

- Was ist Ansible
  - Simple Automatisierungs Sprache die eine IT Anwendung/Infrastruktur beschreibt
  - Ist eine Automation Engine

- Ansible ist
  https://ansible.github.io/lightbulb/decks/ansible-essentials.html#/3

  - Einfach
    - Sehr gute Lesbarkeit
    - Keine speziellen Programmierkenntnisse notwendig
    - Führt jeden Task in der vorgegebenen Reihenfolge aus
  - Mächtig
    - Anwendungsentwicklung
    - Workflow Orchestrierung
  - Agentless
    - OpenSSH(Linux)
      - Target benötig Python 2.6/2.7
    - WinRM(Windows)
      - Target benötigt Powershell 3
    - Keine Agent Software die man Patchen muss

  - Bild über Control Machine / Hosts

- Für was kann es eingesetzt werden
  - Config Management
  - Application Deployment
  - Provsioning
  - Continous Delivery
  - Security & Coompliance
  - Orchestration

- Swiss Army Knife für Automatisierung

- Warum Ansible und nicht Chef/Puppet/Salt
  - Einfach
  - Läuft von Oben nach unten
  - Sehr einfach erweiterbar
  - Benötigt keinen Server
  - Kann am Techniker Client ausgeführt werden

- Ansible Installieren
  - Benötigt Python 2.6/2.7
  - in einer VM
    - Centos/RHEL
    - Debian Based
    - PIP
  - WSL (Unsupported, aber funktioniert für meine zwecke einwandfrei / VM ist viel Schneller / WSL ist langsam bei vielen File IOs (Python))
  - cygwin (Unsupported, noch nie probiert)

## Ansible Installieren

- os requirements
- per package, aber pip ist meistens sinvoller
- pip Install mit Braches zeigen
- pip Install in einer venv

## Wie funktioniert Ansible

https://ansible.github.io/lightbulb/decks/ansible-essentials.html#/12

- Playbook
- Modules
- Plugins
  - Action Plugins
  - Callback Plugins
  - Connection Plugins
    - WinRM
    - SSH
  - Filters
  - Inventory Plugins
- Inventory
  - Inventory als File
  - Inventory Plugin
  - Dynamic Inventory

## Module

- Modules
  - Sind die Tools im Toolkit :-)
  - Welche Module gibt es
    - Link zur Liste
    - Most common once List
    - Most common once List Windows
      - run Script
        - Run Shell Script Example

  - Modul Dokumentation
  - ansible-doc
    - ansible-doc -l
    - ansible-doc copy

- ansible module Run
  - Immer schauen ob es ein Modul gibt
  - Unterschied zwiuschen
    - command
    - shell

## Inventory

- Inventory
  - Hosts
  - Groups
  - Inventory spezifische Variablen
  - Statische und dynamische Resourcen
  - Statisches Inventory
    - Ini File
      - unterscheid zwischen inventory name und ansible_host
      - Variablen für Verbindung (ansible_ssh_private_key_file, ansible_user, ansible_password, ansible_connection, winrm)
  - ansible-inventory
  - Pfad relation zu Inventory und group_vars/host_vars

## Facts

- Was sind Facts
  Auslesen der Facts
- Wan werden die Facts generiert
- Facts zwischenspeichern
  - Redis
  - Json

## Ansible Ad-Hoc

- Ad-Hoc

  - Add Hoc mit Shell Commands
    ansible all -i "172.16.233.21,172.16.233.22," -m ping --private-key=~/.ssh/workshop.key
    ansible all -i "172.16.233.21,172.16.233.22," -a "uptime" --private-key=~/.ssh/workshop.key
    ansible all -i "172.16.233.21,172.16.233.22," -a "uname -a" --private-key=~/.ssh/workshop.key
    > Komma ist notwendig, da er eine Liste erwartet
  
  - Add Hoc mit Module
  - ansible mit inventory file
  - mit Sudo --become
    --limit
  - become-user, --ask-become-pass

  - Für was sind Ad-Hoc
  - Kurzbeschreibung von -m -a -b -e --version --help
  - Wann Ad-hoc nehmen gegenüber einem Playbook
    - zb. Neustarten der Server, geht schneller als ein playbook schreiben

- Demo
  - Inventory File
  - ansible ad-hoc command

- Übung
  - ping auf allen 3 Linux Hosts ausführen
  - setup auf allen 4 Hosts ausführen
  - Inventory File machen für unsere 3 Hosts
  - facts auslesen
  - ping module ausführen
  - setup module ausführen
  - Hosts All beim Add-Hoc call

- Pause

## Playbook Übersicht

- Übersicht mit dein einzelen Teilen Herzeigen und dann beschreiben

### Variablen

- Für was sind die Variablen
  - Metadaten für jeden Host
- Woher können Variablen kommen
  - Commandline
  - plays/tasks
  - files
  - inventory
  - discovery facts

- Variable Orders nach Vorrang
  1. extra_vars
  2. task_vars
  3. block_vars
  4. role vars
  5. play vars_files
  6. play vars_prompt
  7. play vars
  8. set_facts
  9. registered vars
  10. host facts
  11. playbook host_vars
  12. playbookt group_vars
  13. inventory host_vars
  14. inventory group_vars
  15. inventory vars
  16. role defaults

- variablen sourcen sehr gering halten
  - Eigene erfahrungen
    - Im Source Repo in group_vars/inventoryvars , sowie per Role Defaults, aber nicht in den playbooks
    - deckt ziemlich jeden usecase app

- Variablen Definieren
  - Dictionarys/Lists

- Benutzung von Variablen
- Benutzen und Angabe
  - Wann ""
  - Wann "{{ }}"

- Demo über Variablen

### Tasks

- Tasks
  - Sind die anwendung von Modulen wie zb.
    - file
    - yum
    - service
    - template
    - get_url
    - git
  - Example herzeigen wie so ein Task ausschaut

    - Kurz beschreibenm, Tasks = Array von Tasks mit -
          tasks:
            - name: Ensure httpd package is latest
              yum:
                name: httpd
                state: latest

            - name: Ensure latest index.html file is present
              copy:
                src: files/index.html
                dest: /var/www/html/
- Handlers
  - Was ist ein Handler
  - Wann wird ein Handler ausgeführt
  - Wie oft wird ein Handler ausgeführt

    ```yaml
      tasks:
      - name: Ensure httpd package is latest
        yum:
          name: httpd
          state: latest
        notify: restart httpd

      - name: Ensure latest index.html file is present
        copy:
          src: files/index.html
          dest: /var/www/html/

      handlers:
      - name: restart httpd
        service:
          name: httpd
          state: restarted
    ```

- Host Selector

## Plays & Playbooks

- Was ist ein Playbook
  Spielt mehrere Plays ( Task Liste ) gegen einen ausgewählte gruppe von Hosts aus in yaml geschrieben
- Best Practice
  - Immer sauber die Plays/tasks beschreiben, damit es lesbar bleibt
  - kann auch beschreibungen enthalten
- Was ist darin enthalten
  - Host Selector (host: )
    - Host Selector Examples
      - webservers:!phoenix
  - Privilege Escalation: "become:yes" = Sudo(Default)
  - Playbook Vars
    - http Port angabe vieliecht


- Übungs
  - Simples Playbook bauen
    - nginx Webserver
    - File Ablegen
    - nginx restarten mit handler

- Pause

##  Debug/Syntax Check

- Playbook checks und hilfen
    --check
    --syntax-check

## Advanced Playbook

- Mehr mit Playbooks machen
  - Templates Jinja2
  - Loops
  - Conditionals
  - Tags
  - Blocks
    - Gibt noch sehr viel mehr, aber dies sind die üblichen
  - Include Playbook ( Loopen von Includes)
  - Filter


### Filter

https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html
- unique
- union
- Load CSV
- Special Filter for
  - Network Hostname

- Templates
  - Ansible beinhaltet die Jinja2 Templating Engine
    - Homepage Zeigen
  - damit kann man
    - Variablen Setzen/Bearbeiten
    - Logic
    - Dateien Erzeugen von einem Template aus
      - zb. Config Files
  - Wir kommen noch später dazu

- Loops
  https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html
  loop:
  with_items:
  with_subelements:
  with_nested:
  loop:
    var:

- Conditionals
  Unterstützt evalurierung der variablen/facts/task result in der laufzeit
  Conditionals sind raw Jinja2 Expression without Double Curly Braces
  - yum:
      name: httpd
      state: latest
    when: ansible_os_family == "RedHat"
  - Es gibt noch andere, aber when: ist normalerweise alles was man braucht

- register
- failed_when
- changed_when

- Pause Übung mit Template und loop für die 2 webserver

# --------------------------------------------------------
# Wir sollten hier beim Mittagessen dann sein!!!!
# --------------------------------------------------------

- Tags
  - Tags sind sinnvoll wenn man nur On-Demand einen Teil des Playbooks ausführen möchte
  - Einfache Form eines Conditional Statments

- Blocks
  - Logische Gruppierung
  - Loop über mehrer tasks hinweg

- delegate_to
- privilege escalation

- Playbook Includen
  - mehrer Playbook files
  - Task Importieren
  - Loop mit einem Playbook Include
  - Sollte Normalerweise in Rolen durchgeführt werden
  - Unterschied zwischen

- **Lookup Plugins** <<<< Fehlt noch !!!

- Übung
  - sites.yml
    - schreiben des motd mit einer group_var all
    - includiert die webserver

  Full Playbook beschreiben
  - mit Condition
  - Templates
  - Loops
  - Blocks
  - Tags

- Übungs
  https://github.com/ansible/lightbulb/tree/master/workshops/ansible_engine/basic_playbook
  - Was machen wir hier
  - Jeweils ein sauberes Handout machen
  - Mit Links zu den Resourcen  
  - Viel Zeit geben

## Roles

- Roles sind fertige Pakete mit Ansible Content zum teilen
  - Erhöt die Lesbarkeit und vereinfacht die Complexität
  - Sind einfach zu teilen, wiederverwenden und zum standrtisieren
  - Kann unabhängig vom Playbook/Projekt/Organisation sein
  - Biete funktionen wie
    - Dateipfad auflösung(zb. Template files)
    - Möglichkeit zur vorgabe von Standart Werten

- Herzeigen einer Typsichen Ansible Role und die Ordner Struktur
  https://ansible.github.io/lightbulb/decks/ansible-essentials.html#/46

- Wie in ein Play Inkludieren
  roles:

- Verzeichnisse der Rolle beschreiben
  - /defaults/main.yml
  - /tasks/main.yml

- Auf Variablen Überschreibung hinweisen!

- Ansible Galaxy
  - Hub für Rolen
  - Rolen immer mit Vorsicht genießen
    - Zuerst durchschauen, dann anwenden :-)
  - Sind von der Ansible Comunity gemacht

- Demo
  - Anwenden einer Role
  - Was beinhaltet eine Role
  - Ordner struktur
  - defaults
  - main
  - Schreiben einer Role?
    - Was beinhaltet die Role

- Die Vorarbeit Refactorn für Rollen
  - Common
  - Webserver

## Ansible Vault - Passwörter

- Beschreibung von Vault
  - Encryption
- Ansible.cfg über Vault Password file
- Ansible Vault File
- Ansible Vault Encode
- Ansible Vault Decrypt

- Demo über Vault File / Encode / Decrypt

- Übung:
  - Encrypted Variable Includieren
- Pause


## Ansible Config File

- Ansible.cfg

## Project Layouts

- Was definiert das Projekt
  - Eines Per Stack
  - Eines per Anwendung
- Basic Project Layout
  http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/7

- Per Anwendung mit Rolen
  http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/8

- Geteilte Rollen mit
  http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/8

  requirements.yml
  
  Können zwischen Projekten Geteilt werden
  https://docs.ansible.com/ansible/latest/reference_appendices/galaxy.html
  ansible-galaxy install -r requirements.yml
  requirements.yml
    - Git Import
    # from GitLab or other git-based scm, using git+ssh
    - src: git@gitlab.company.com:mygroup/ansible-base.git
      scm: git
      version: "0.1"  # quoted, so YAML doesn't parse this as a floating-point value
  
      # from a webserver, where the role is packaged in a tar.gz
    - src: https://some.webserver.example.com/files/master.tar.gz
      name: http-role

## Windows

- winrm config script
- powershell script
- win_dsc

## Module Development

- Pyhton Module
  - Simples Modul bauen
- Powershell Module
  - Simples Modul bauen

## Best Practice

http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/2

Principal 1
  - Complexity Kills Productivity
Pricipal 2
- Optimize for Readability
  - Dokumentieren
  - Saubere Intent
Principal 3
- Nicht Code Schreiben, eher Deklarieren ( Was will ich machen )
  - YAML ist nicht für das Programmieren gedacht

Principal 4
- Workflow
  - Version Control
  - So Simple wie möglich anfangen
  - Refactor bzw. Modulrisieren

- Vieleicht ein style guide
  - Tagging
  - Whitespace
  - Naming der Tasks/Plays/Variablen/Rolen
  - Verzeichnis Layouts
- Style Enforcen(Wie?)

### inventory

- human-meaningul names, besser als ip oder dns
- Group Hosts
  - What
    - Application Stack
    - Service
  - Where
    Local DNS, Storage, etc
    - Datacenter
    - Region
  - When
    - dev
    - test
    - prod
- Single Inventory Source
  - kann nicht out-of-sync werden
  - vieleicht per Kunde
  - entfernt menschliceh fehler
- Variablen
  - Beschreibenede, und human-meaningful Variablen benutzen
  - Wenn es Rolen Variablen sind mt Rolenname oder Package Prefixen, damit es nicht zu überschreibungen kommt
  - Vieleicht ein example bauen
    - Siehe:
      - http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/15
      - http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/16
  - Nativ YAML Syntax nutzen
    - Erhöht die Lesbarkeit
    - Funktioniert besser mit Editoren
      - NO
        http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/18
      - YES
        http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/19

- Cleanup Debuggin Statements
- Immer in Kleineren Subsets arbeiten, anstatt ein großes Playbook
- KISS
  - Linux Principle do one thing and one thing well

- Smoke Tests
  - nicht nur den Service Starten, sondern auch überprüfen?
  - http://ansible.github.io/lightbulb/decks/ansible-best-practices.html#/26

- Run Command ist immer als letztes mittel zu benutzen!

- Label Templates
  - {{ ansible_managed | comment }}

- Rolen
  - Rolen Einfach halten
  - Rolen dependencies definieren
    - Immer eine getaggte Version beinhalten
  - Ansible Galaxy Pattern

## Logging

- ARA https://ara.readthedocs.io/en/latest/index.html
- Zeigen das es bereits installiert ist auf dem ansible control host
  - Wie das aussieht
    - ansible.cfg konifgurieren
    - playbook run zeigen

## Scaling / REST API

- Ansible Tower
- Rundeck
- Stackstorm

## Ansible for Network Devices

- https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html#network-cli-filters

- Config File Generierung mit Templates
  - Danach Uploaden
- Sehr viele Module
  - Für Comware leider nur ein sehr altes
    https://github.com/HPENetworking/ansible-hpe-cw7

- Fortigate
  https://docs.ansible.com/ansible/latest/modules/list_of_network_modules.html#fortimanager
  - Grundlegendes
  - config backup und Upload
  - Simple Rules
- Wenn kein Modul
  - network-cli https://docs.ansible.com/ansible/latest/plugins/connection/network_cli.html
  - napalm https://napalm.readthedocs.io/en/latest/integrations/ansible/index.html

## Ende

- Slogang
- Bedanken
- Fragen