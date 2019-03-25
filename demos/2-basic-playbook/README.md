# Basic Playbook

```bash
ansible-playbook <playbook> -i <inventory_file>
ansible-playbook simple.yml -i inventory.ini
```

## Übung

- Kopiere die voher erstellte **inventory.ini** von 1-addhoc in den neuen Workfolder
  - Erstelle eine neue Inventory Gruppe für die Debian Server 'web'
- Erstelle ein Playbook "simple.yml" mit folgenden Tasks/Handlers
  - Installiere **nginx** auf beiden Debian hosts (apt)
  - Kopiere **index.html**/**image.jpg** in das webroot **/var/www/html** (copy)
  - Handler benutzen, um das restarten des services **nginx.service** zu vermeiden bei mehrmaligen aufruf
  - Stelle sicher das das Playbook öfters ausgeführt werden kann und es kein **changed** retour liefert
- Teste ob die beiden Debian Hosts eine Website bereitstellen mit dem Browser über den Public FQDN

## Module Hints

https://docs.ansible.com/ansible/latest/modules/modules_by_category.html?highlight=module%20index

- copy (https://docs.ansible.com/ansible/latest/modules/copy_module.html)
- apt (https://docs.ansible.com/ansible/latest/modules/apt_module.html?highlight=apt)
- service (https://docs.ansible.com/ansible/latest/modules/service_module.html#service-module)

## Playbook File - Hints

```yaml

- name: "Make me an awesome webserver"
  hosts: web
  become: yes     # We need sudo!
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
