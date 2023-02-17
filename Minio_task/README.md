Задача: поднять S3-хранилище с помощью контейнера minio в Docker Swarm с помощью Ansible и
в Kubernetes.
Чекпоинты:
  
  Light:
1. Развернуть виртуальную маширу с linux с помощью Vagrant.
2. Установить docker и запустить minio из стандартного образа.
3. Освоить docker-secret, создать для minio access key и secret key внутри docker secret.
4. Создать 4 виртуальные машины, освоить docker swarm и включить все машины в общий кластер
docker swarm.
5. Развернуть minio через docker stack в кластере docker swarm.
6. Освоить dockerfile-инструкцию HEALTHCHECK и добавить проверку в stack.
  
  Normal:
1. Написать Ansible Playbook для развертывания docker на 4 нодах.
2. Написать Ansible Playbook для развертывания кластера swarm на 4 нодах, вынести в отдельную
роль атомарные операции, типа установки Docker с создания Swarm.
3. Создать отдельную Ansible-роль для развертывания minio через swarm(ansible-role-minio-swarm).
4. Учесть в ролях создание docker-secret, автоматические ip-адреса узлов, вынести все 
настраиваемые параметры в переменные.
5. Сделать jinja-шаблон для stack-файла, который динамически формируется с учётом количества
нод и их настроек.
6. Покрыть роли тестами через molecule и настроить подключение и версионирование через личный
galaxy в gitlab.
  
  Hard:
1. Развернуть в minio standalone в облачном Kubernetes, на ваш выбор.
2. Развернуть в Kubernetes minio-operator.
