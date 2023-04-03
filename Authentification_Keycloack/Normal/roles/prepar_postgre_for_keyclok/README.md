Prepar PostgreSQL DB for use Keyclok
=========

Данная роль создает в PostgreSQL пользователя и базу данных для Keyclok, после чего восстанавливает backup базу данных Keyclok, тем самым мы можем восстановить, в случае неполадок, Keyclok из backup БД, так как все данные Keyclok хранит в используемой базе данных.

Requirements
------------

Использование ОС Ubuntu/Debian и установленный на ней PostgreSQL.

Role Variables
--------------

db_user        - пользователь в БД для Keycloak
db_user_passwd - пароль для пользователя в БД для Keycloak
db_name        - имя БД для Keycloak

Dependencies
------------

install_postgresql_14 - роль для установки PostgreSQL

Example Playbook
----------------

- name: Prepar PostgreSQL DB for use Keycloak
  hosts: all
  become: yes
  roles:
    - prepar_postgre_for_keyclok

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
