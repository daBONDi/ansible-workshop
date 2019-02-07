# Build Workshop Environments in AWS

## Required Python Packages

- ansible
- boto3
- boto

## TODO

- RSYNC / SCP?

## Configure  Workshop Environment

- Edit env_config.yml
  - Enter the Workshop Instance Name:  **\<workshop_instance_name>**
  - Enter the desired: **\<workshop_attendant_count>**

## Setup Workshop Environment

> Ensure neede Environment Variables are set

```bash
export AWS_ACCESS_KEY_ID=<EnterID>
export AWS_SECRET_ACCESS_KEY=<EnterKey>
ansible-playbook setup.yml
```

## Destroy Workshop Environment

```bash
export AWS_ACCESS_KEY_ID=<EnterID>
export AWS_SECRET_ACCESS_KEY=<EnterKey>
ansible-playbook destroy.yml
```

## Environment Keys

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

```bash
#!/bin/sh
export AWS_ACCESS_KEY_ID=<EnterID>
export AWS_SECRET_ACCESS_KEY=<EnterKey>
```

## How the get a AWS Access Key ID/Secret

- AWS Account Overview
- Account Menu (Upper-right, Has your name on it)
- Sub-Menu: My Security Credentials
- Create AWS Access ID/Key