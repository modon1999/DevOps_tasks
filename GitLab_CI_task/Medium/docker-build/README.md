Репозиторий для сбора модулей, для дальнейшего переиспользования
----------------------------------------------------------------------------------------
В файле check_linter_golang.yml используется переменная CLONE_LINT_CONF, это переменная 
созданная вручную в GitLab и содержащая индивидуальный токен доступа, для скачивания 
файлы конфигурации для проверки линтеров, я решил сделать его единым, так как одной из
задач использование проверки линтеров является стандартизация кода всех разработчиков,
поэтому он должен быть одним для всех.