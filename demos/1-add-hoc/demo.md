# add-hoc demo

## Inventory File Bauen

- Linux und Windows Gruppen
- Linux / Windows Connection Vars

```ini
ctrl ansible_host=10.0.1.10
debian1 ansible_host=10.0.1.21
debian2 ansible_host=10.0.1.22
win1 ansible_host=10.0.1.41

[windows]
win1

[linux]
ctrl
debian1
debian2

[linux:vars]
ansible_user=admin
ansible_port=22
ansible_ssh_private_key_file="~/.ssh/workshop.key"
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[windows:vars]
ansible_connection=winrm
ansible_user="Administrator"
ansible_password="ansible#workshop1"
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore
ansible_port=5986
```

## Ansible Ad-Hoc Commands

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
    
    - Mehrmals ausführen, sollte keinen Change zurückmelden

    - Windows Host "win1" neustarten Module: win_reboot

```bash
# Ansible Inventory abfrage
ansible-inventory --host debian1 -i inventory.ini

# Einen einzelnen Host ansprechen ohne inventory
ansible all -m ping -i "10.0.1.21," --private-key=~/.ssh/workshop.key

# Alle Linux Hosts anpingen
ansible linux -m ping -i inventory.ini

# uptime
ansible linux -m command -a "uptime" -i inventory.ini

# win_ping
ansible windows -m win_ping

# windows version herausfinden
ansible windows -m win_shell -a "whoami" -i inventory.ini

# Facts abrufen
ansible all -m setup -i inventory.ini

# Copy File To Linux
ansible linux -m copy -a "src=userfile.txt dest=~/userfile.txt" -i inventory.ini

# Copy File to Windows
ansible windows -m win_copy -a "src=userfile.txt dest=c:/users/administrator/desktop/userfile.txt" -i inventory.ini

# win1 neustarten
ansible win1 -m win_reboot -i inventory.ini
```