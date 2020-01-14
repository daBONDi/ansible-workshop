# Add-Hoc Übung

```bash
ansible <Host Filter> -m <Modul> -a "<Arguments: test=1 test=2" -i <inventoryfile>
```

## Übung

- Ein statisches Inventory File schreiben "inventory.ini" für die AWS Hosts
- debian1 mit "ansible-inventory" abfragen
- Ansible Ad-Hoc Commands ausführen
  - ping auf Linux Hosts
  - Uptime der Linux Hosts herausfinden mit "command" Module und Argument "uptime"
  - win_ping auf Windows Hosts
  - Windows WinRM User herrausfinden mit Modul "win_command"/"whoami"
  - Hostfacts von allen hosts abfragen (setup)
  - userfile.txt kopieren nach (copy,win_copy)

    - Linux: ~/userfile.txt

      ```bash
      ansible-doc copy
      ```

      https://docs.ansible.com/ansible/latest/modules/copy_module.html?highlight=copy

    - Windows: c:/Users/Administrator/Desktop/userfile.txt

      ```bash
      ansible-doc win_copy
      ```

      https://docs.ansible.com/ansible/latest/modules/win_copy_module.html?highlight=win_copy
    
    - Copy Mehrmals ausführen, sollte keinen "Changed" zurückmelden

    - Windows Host "win1" neustarten. Modul: "win_reboot"
      - Liefert ein "Changed" wenn Host wieder up ist

## Inventory Hints

```ini
debian1 ansible_host=10.0.1.21
...

[linux]
debian1
...

[windows]
win1

[linux:vars]
ansible_user=admin
ansible_port=22
ansible_ssh_private_key_file="~/.ssh/workshop.key"
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_become=yes

[windows:vars]
ansible_connection=winrm
ansible_user="Administrator"
ansible_password="ansible#workshop1"
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore
ansible_port=5986
```