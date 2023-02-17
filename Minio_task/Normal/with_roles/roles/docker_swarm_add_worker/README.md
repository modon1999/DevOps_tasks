Docker Swarm Add Worker
=========

Данная роль добавляет worker node в Docker Swarm на ОС под управлением Ubuntu. Данную роль необходимо запускать обязательно только в группе хостов продназначенных как worker node

Requirements
------------

Единственным требованием является использование ОС Ubuntu.

Role Variables
--------------

В данной роли переменные не используются.

Dependencies
------------

install_docker - данная роль устанавливает Docker
docker_swarm_init - роль инициализирует Docker Swarm

Example Playbook
----------------

- name: Install Docker
  hosts: all
  become: yes
  roles:
    - install_docker
- name: Initialize Docker Swarm
  hosts: all
  become: yes
  roles:
    - docker_swarm_init
- name: Add Workers to the Swarm
  hosts: swarm_workers
  become: yes
  roles:
    - docker_swarm_add_worker

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
