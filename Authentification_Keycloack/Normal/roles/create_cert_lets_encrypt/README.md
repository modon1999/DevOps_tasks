Create Cert Lets Encrypt
=========

Данная роль устанавливает certbot на ОС под управлением Ubuntu/Debian, и создает сертификат, с соответствии с указанным доменом.

Requirements
------------

Использование ОС Ubuntu/Debian, настроенный на данный сервер домен и открытые 80 и 443 порты.

Role Variables
--------------

domain - используемый домен
email  - email при создании сертификата на Lets Encrypt

Dependencies
------------

Зависимостей данная роль не имеет

Example Playbook
----------------

- name: Create Cert Lets Encrypt
  hosts: all
  become: yes
  roles:
    - create_cert_lets_encrypt

License
-------

BSD

Author Information
------------------

Author: Nikira Grigorev
GitHub: https://github.com/modon1999
