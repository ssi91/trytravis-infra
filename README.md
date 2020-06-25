# ssi91_infra
ssi91 Infra repository

## HW #2

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
