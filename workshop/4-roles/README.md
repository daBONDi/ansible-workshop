# Roles - Übung 4

- Erstelle eine Role für die Webanwendung von Übung 3 und implementiere diese auch für den Windows Host "win1"
  - /roles/myapp/tasks
  - /roles/myapp/files
  - /roles/myapp/templates
  - /roles/myapp/defaults
  - /roles/myapp/handlers
- Kopiere alle Files von den vorherigen Übungungen und verschiebe
  - index.html > /roles/myapp/templates
  - Bilder > /roles/myapp/files
- Erstelle ein host_vars File für Host **win1**
- Verwende Rollen Variablen, anstatt Host Variablen(**Kapseln der Rolle nicht vergessen!!!**) und übergebe die Host Variablen der Rolle
  - Adaptiere die "index.html" so das die neuen Rolen Variablen verwendet werden
- Verwende /roles/myapp/handlers/main.yml für den restart_nginx handler
- Suche ein png für den Windows Host aus, das dann für das "image.png" im Webroot verwendet wird
- Teste ob alle 3 Webserver die richtige index.html sowie Bild bereitstellen

## Hints

- Erstelle ein yml File für Debian und Windows(debian.yml, windows.yml) und benutze die OS Detection für das richtige Task File

- OS Detection
  ```yaml
  - include_tasks: debian.yml
    when: "ansible_os_family == 'Debian'" 

  - include_tasks: windows.yml
    when: "ansible_os_family == 'Windows'" 
  ````

- Role Directoy Layout
  ```yaml
  - role
    - role_name
      - defaults
          main.yml
      - handlers
          main.yml
      - files
          image1.jpg
          image2.jpg
          windows.png
      - templates
          index.html
      - tasks
          main.yml
          windows.yml
          debian.yml
  ```

- Windows IIS Installation

  Benutze das **win_feature Modul** für die IIS Installation: 
  https://docs.ansible.com/ansible/latest/modules/win_feature_module.html
  

- Windows IIS Pfad für Index.html
  ```
  c:\inetpub\wwwroot\default.html
  c:\inetpub\wwwroot\image.png
  ```

## Playbook File - Hints

```yaml

- name: "Make me an awesome webserver"
  hosts: web,win1
  tasks:
    - import_role: name=myapp
      vars:
        config: "{{ app_config }}"

```