Install Docker
=========

Данная роль устанавливает Docker на ОС под управлением Ubuntu.

Requirements
------------

Единственным требованием является использование ОС Ubuntu.

Role Variables
--------------

В данной роли переменные не используются.

Dependencies
------------

Зависимостей данная роль не имеет

Example Playbook
----------------

- name: Install Docker
  hosts: all
  become: yes
  roles:
    - install_docker

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
