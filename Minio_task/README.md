������: ������� S3-��������� � ������� ���������� minio � Docker Swarm � ������� Ansible �
� Kubernetes.
���������:
  Light:
1. ���������� ����������� ������ � linux � ������� Vagrant.
2. ���������� docker � ��������� minio �� ������������ ������.
3. ������� docker-secret, ������� ��� minio access key � secret key ������ docker secret.
4. ������� 4 ����������� ������, ������� docker swarm � �������� ��� ������ � ����� �������
docker swarm.
5. ���������� minio ����� docker stack � �������� docker swarm.
6. ������� dockerfile-���������� HEALTHCHECK � �������� �������� � stack.
  Normal:
1. �������� Ansible Playbook ��� ������������� docker �� 4 �����.
2. �������� Ansible Playbook ��� ������������� �������� swarm �� 4 �����, ������� � ���������
���� ��������� ��������, ���� ��������� Docker � �������� Swarm.
3. ������� ��������� Ansible-���� ��� ������������� minio ����� swarm(ansible-role-minio-swarm).
4. ������ � ����� �������� docker-secret, �������������� ip-������ �����, ������� ��� 
������������� ��������� � ����������.
5. ������� jinja-������ ��� stack-�����, ������� ����������� ����������� � ������ ����������
��� � �� ��������.
6. ������� ���� ������� ����� molecule � ��������� ����������� � ��������������� ����� ������
galaxy � gitlab.
  Hard:
1. ���������� � minio standalone � �������� Kubernetes, �� ��� �����.
2. ���������� � Kubernetes minio-operator.