bastion_IP = 34.65.63.20
someinternalhost_IP = 10.172.0.3

# MurMurt_infra
MurMurt Infra repository

# Homework #3

connect by one line:
ssh -A appuser@34.65.63.20 -t 'ssh 10.172.0.3'

connect by one line 2:
	command: ssh inrenal
	description: Сделано через ProxyJump. Конфиг лежит в helpers/ssh_jump_config

url for pritunl https://murmurt.ml


testapp_IP = 35.204.77.162
testapp_port = 9292

# Homework #4
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
