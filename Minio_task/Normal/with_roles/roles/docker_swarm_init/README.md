Docker Swarm Init
=========

Данная роль инициализирует Docker Swarm на ОС под управлением Ubuntu. Данную роль необходимо запускать обязательно со всеми хостами, иначе они не получать важные переменные manager_token, worker_token и ip_manager_swarm, которые необходима для дальнейшего развертывания кластера. При этом она должна выполнится обязательно на одном из Manager кластеров.

Requirements
------------

Единственным требованием является использование ОС Ubuntu.

Role Variables
--------------

В данной роли переменные не используются.

Dependencies
------------

install_docker - данная роль устанавливает Docker

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

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
