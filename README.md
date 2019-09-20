# MurMurt_infra
MurMurt Infra repository

## Homework 2

bastion_IP = 34.65.63.20
someinternalhost_IP = 10.172.0.3

connect by one line:
ssh -A appuser@34.65.63.20 -t 'ssh 10.172.0.3'

connect by one line 2:
	command: ssh inrenal
	description: Сделано через ProxyJump. Конфиг лежит в helpers/ssh_jump_config

url for pritunl https://murmurt.ml


testapp_IP = 35.204.77.162
testapp_port = 9292

## Homework 3
To create startup.sh use create_startup.sh

Cmd with startup.sh
```
gcloud compute instances create reddit-app  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata-from-file startup-script=startup.sh
```

Cmd with startup-script-url:
Befone use startup-script-url upload file:
```
gsutil cp user_infra/startup.sh gs://user-infra-bucket
gsutil ls gs://murmurt-infra-bucket
```

```
gcloud compute instances create reddit-app  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata startup-script-url=gs://murmurt-infra-bucket/startup.sh
```

Cmd to create firewall rule:
```
gcloud compute --project=infra-244914 firewall-rules create default-puma-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server
```

## Homework 4
### Сборка образов VM при помощи Packer

Установил Packer
Установил Application Default Credentials для работы Packer с GCP
Написал шаблон для образа на Ubuntu
На основе базового образа создал baked образ с приложением
Написал скрипт для запуска vm на основе baked образа

## Homework 5
#### Основное задание

- Определил input переменную для приватного ключа (private_key_path)
- Определил input переменную для задания зоны (google_compute_instance)
- Отформатировал файлы командой ``` terraform fmt```
- Создал файл ```terraform.tfvars.example``` с примером заполнения файла с переменными

#### Задание со *
- Добавил ключи для appuser1 и appuser2
- Добавил ключ через web-интерфейс

Обнаружил проблему:
После выполнения команды ```terraform apply```, ключ, который был добавлен через web-интерфейс удаляется.

## Homework 6
- Определили ресурс файервола
- Импортировали существующую инфраструктуру в Terraform
- Разбили конфиги по файлам
- Научились работать с модулями
- Параметризовали модули
- Создали storage bucket

## Homework 7 Знакомство с Ansible

- Установка Ansible
- Конфигурация Ansible
- Написание простого плейбука
- Создание динамического инвентори в формате JSON

Про вызов ```ansible-playbook clone.yml```:
    Если на машинке уже был склонирован репозиторий, то в выводе команды будет ```changed=0 ```, иначе ```changed=1```
   
Про динамический inventory:
    Решил получить список хостов через api gcp engine и сгруппировать их по первому тегу.
    Чтобы использовать api необходимо создать сredentials и в положить переменную окружения ```GOOGLE_APPLICATION_CREDENTIALS``` 
    путь до файла с сredentials.
    Необходимые библиотеки для работы скрипта в файле ```requirements.txt```

## Homework 8 Деплой и управление конфигурацией с Ansible
    ```branch: ansible-2```
    
- Создадали плейбук для управления конфигурацией и деплоя нашего приложения
- Использовали модуль template, чтобы скопировать 
    параметризированный локальный конфиг файл MongoDB на
    удаленный хост по указанному пути.
- Определили handler для рестарта БД и добавили вызов handler-а

#### Настройка инстанса приложения

- Создали Unit для приложения
- Добавили шаблон для приложения

#### Деплой

- Использовали модули git и bundle для клонирования
    последней версии кода нашего приложения
    
#### Один плейбук, несколько сценариев

- Создали несколько сценариев, разделив их тегами

#### Несколько плейбуков

- В директории ansible создадим три новых файла:
    app.yml
    db.yml
    deploy.yml
- Создали файл site.yml, в котором описано управление конфигурацией всей нашей инфраструктуры.

#### Провижининг в Packer

- Создали плейбуки packer_app.yml и packer_db.yml (provision в Packer).
- Описали с помощью модулей Ansible в плейбуках действия, аналогичные bash-скриптам.
- Проверили сборку образов
- Проверили работу приложения на новых образах

## Homework 9 Ansible: работа с ролями и окружениями

- Переносим созданные плейбуки в раздельные роли
- Описываем два окружения
- Используем коммьюнити роль nginx
- Используем Ansible Vault для наших окружений


https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html#create-an-instance
https://docs.ansible.com/ansible/latest/plugins/inventory/gcp_compute.html#examples