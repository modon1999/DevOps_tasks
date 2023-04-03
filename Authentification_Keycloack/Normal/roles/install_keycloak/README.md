Install Keycloak
=========

Данная роль устанавливает на ОС Ubuntu/Debian Keycloak.

Requirements
------------

Использование ОС Ubuntu/Debian, установленный PostgreSQL.

Role Variables
--------------

db_user        - пользователь в БД для Keycloak
db_user_passwd - пароль для пользователя в БД для Keycloak
db_name        - имя БД для Keycloak
domain         - используемый домен
https_port     - порт который будет прослушивать Keycloak для ответа по HTTPS(HTTP выключен)

Dependencies
------------

install_postgresql_14      - роль для установки PostgreSQL
prepar_postgre_for_keyclok - роль для подготовки БД PostgreSQL к работе Keycloak
create_cert_lets_encrypt   - роль для создания сертификата от Lets Encrypt

Example Playbook
----------------

- name: Install Keycloak
  hosts: all
  become: yes
  roles:
    - install_keycloak

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
