ansible-debian-11-post-install
==============================
Installs some essential packages and applies some basic configurations.

Requirements
------------
Requires Ansible 2.10 or later. This role has only been tested on Debian 11 (Bullseye).

Role Variables
--------------
A list of packages for installation are defined in `defaults/main.yml`.

Dependencies
------------
None

Example Playbook
----------------
    - hosts: all
      become: yes
      become_method: sudo
      roles:
        - ansible-debian-11-post-install



Example Inventory
-----------------
*The `machine_hostname` variable is created for consistency when no DNS record exists*

*inventory.ini*

    [servers]
    192.168.0.11 ansible_ssh_user=admin machine_hostname=server01
    192.168.0.12 ansible_ssh_user=admin machine_hostname=server02
    192.168.0.13 ansible_ssh_user=admin machine_hostname=server03

*inventory.yml*

    ---
    all:
      hosts:
        192.168.0.11:
        192.168.0.12:
        192.168.0.13:
      vars:
        ansible_ssh_user: admin
        machine_hostname: server01


License
-------
GPL-3.0 License

Author Information
------------------
This role was created by Dan Kir
