# Advanced Playbook

```bash
ansible-playbook <playbook> -i <inventory_file>
ansible-playbook simple.yml -i inventory.ini
```

## Übung

### Vorarbeiten

- Kopiere die voher erstellte **inventory.ini** in das neue Arbeitsverzeichniss
- Kopiere das voher erstellte **simple.yml** Playbook in das neue Arbeitsverzeichniss
- Erstelle Host Variablen Dateien für beide Server im Unterverzeichniss host_vars

```yaml
# host_vars/debian1.yml
app_config:
  title: "Automate all the things!"
  image: image1.jpg
```

```yaml
# host_vars/debian2.yml
app_config:
  title: "I know Ansible and Yaml!"
  image: image2.jpg
```

### Aufgabe

Adaptiere das Playbook **simple.yml** das die index.html Dateien der Server anpasst und die richtige Bilddatei kopiert mit Zuhilfenahme der definierten Host Variablen.

#### Bild Datei

Stelle sicher das die richtige Bild Datei auf dem Server kopiert wird (copy, Variable **app_config.image** verwenden)

debian1:  image1.jpg
debian2:  image2.jpg

##### index.html

- Kopiere die **index.html** Datei der vorherigen Übung in das neue Arbeitsverzeichniss
- Adaptiere die **index.html** mithilfe des Modules **template** damit folgendes erscheint (jinja2 templating)
  - debian1:
    - Als HTML Text "Automate all the things!" anzeigen
    - Es sollte auch das Bild "image1.jpg" verwendet werden
  - debian2:
    - Als HTML Text "I know Ansible and Yaml!" anzeigen
    - Es sollte auch das Bild "image2.jpg" verwendet werden

- Teste ob die beiden Debian Hosts eine Website bereitstellen mit dem Browser über den Public FQDN.
- Überprüfe ob der richtige Text sowie das richtige Bild angezeigt wird.

## Module Hints

https://docs.ansible.com/ansible/latest/modules/modules_by_category.html?highlight=module%20index

- copy (https://docs.ansible.com/ansible/latest/modules/copy_module.html)
- apt (https://docs.ansible.com/ansible/latest/modules/apt_module.html?highlight=apt)
- service (https://docs.ansible.com/ansible/latest/modules/service_module.html#service-module)
- template (https://docs.ansible.com/ansible/latest/modules/template_module.html)

## index.html - Hints

```html
<html>
  <head>
    <title>Ansible Configured Host</title>
  </head>
  <body>
    <h2>{{ variable.variable }}</h2>
    <img src="{{ variable.variable }}"/>
  </body>
</html>
```

## Playbook File - Hints

```yaml

- name: "Make me an awesome webserver"
  hosts: web
  tasks:
    - name: <Beschreibung>
      <Module>:
        <Modul Parameter>
        <Modul Parameter>
        <Modul Parameter>
      notify: <Handler Name>
    - <Another Task>
  handlers:
    # Don't forget some awesome comments!
    - name: <Handler Name>
      <Module>
        <Module Parameter>
        <Module Parameter>
        <Module Parameter>
```
