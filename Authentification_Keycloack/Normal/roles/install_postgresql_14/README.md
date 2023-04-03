Install PostgreSQL-14
=========

Данная роль устанавливает PostgreSQL-14 на ОС под управлением Ubuntu/Debian.

Requirements
------------

Единственным требованием является использование ОС Ubuntu/Debian.

Role Variables
--------------

В данной роли переменные не используются.

Dependencies
------------

Зависимостей данная роль не имеет

Example Playbook
----------------

- name: Install PostgreSQL-14
  hosts: all
  become: yes
  roles:
    - install_postgresql_14

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
