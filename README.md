# ssi91_infra
ssi91 Infra repository

## HW #3

### Для подключения к ВМ во внутренней сети черeз bastion одной командой:
```bash
ssh -i ~/.ssh/appuser -At appuser@84.201.128.115 ssh 10.130.0.24
```

### Для подключения к ВМ во внутренней сети черeз bastion комадной
```bash
ssh someinternalhost
```
нужно создать файл `config` в `~/.ssh/`, внутри которого
```
Host someinternalhost
  HostName someinternalhost
  ForwardAgent yes
  ProxyJump appuser@34.89.203.55
  User appuser
  IdentityFile ~/.ssh/appuser
```

bastion_IP = 84.201.128.115
someinternalhost_IP = 10.130.0.24

### Дополнительно
Добавлен сертификат на сервер bastion, теперь сервер доступет по `https` по адресу https://84.201.128.115.sslip.io/


## HW #4

testapp_IP = 130.193.39.229
testapp_port = 9292

### Дополнительно
Добавлен `metadata.yaml` конфиг для конфигурации ВМ во время создания:

```bash
yc compute instance create \
--name "$1" \
--hostname "$1" \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--metadata-from-file user-data=metadata.yaml
```

## HW #5
- Создан образ для reddit-app с необходимыми зависимостями для деплоя и работы приложения

### Дополнительно
- Создан baked образ `immutable.json` для reddit-app, в котором создан systemd-сервис с приложением.
- Создан скрипт create-rddit-vm.sh, создающий ВМ из baked образа

## HW #6
- реализовано описание инфраструктуры для приложение reddit-app
- создан файл `terraform.tfvars.example` с примером параметров для создания инфраструктуры

### Дополнительно
- Созданы ресурсы Балансировщика и Целевой Группы для него
- Добавлена input-переменная `counts` для задания количества VM

## HW #7
- настроенный окружения stage и prod в terraform
- добавлены модули для переисподьзования конфигураций образов VM
