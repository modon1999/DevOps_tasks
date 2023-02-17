Deploy Docker Stack Minio
=========

Данная роль деплоит Minio в Docker Swarm на ОС под управлением Ubuntu. Данную роль необходимо запускать обязательно на всех хостах, но выполнится она должна только на одном из managers.

Requirements
------------

Единственным требованием является использование ОС Ubuntu.

Role Variables
--------------

В данной роли переменные не используются.

root_password - зашифрованный пароль на вход в Minio
root_user - зашифрованное имя пользователя на вход в Minio
swarm_managers - указывает на название группы со Swarm Managers

Dependencies
------------

install_docker - данная роль устанавливает Docker
docker_swarm_init - роль инициализирует Docker Swarm
docker_swarm_add_manager - роль добавляет manager node в Docker Swarm
docker_swarm_add_worker - роль добавляет worker node в Docker Swarm

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

#===== Необязательная часть ====
# - name: Add Managers to the Swarm
#   hosts: swarm_managers
#   become: yes
#   roles:
#     - docker_swarm_add_manager
#
# - name: Add Workers to the Swarm
#   hosts: swarm_workers
#   become: yes
#   roles:
#     - docker_swarm_add_worker

- name: Deploy Docker Stack Minio
  hosts: swarm_managers
  become: yes
  roles:
    - deploy_docker_stack_minio

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
