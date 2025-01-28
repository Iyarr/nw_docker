# ネットワーク構成図

## RIP

## v1

![RIPv1](./svg/rip_v1_nw.svg)

## etc

### ブロードキャストストーム

パケットがループしてしまうことで発生する現象をあえて発生させたい。

CPUの使用率などをPrometheusで観察したい。

![ブロードキャストストーム](./svg/etc_broadcast_storm.svg)

## memo

### command集

```bash
# plan
terraform plan -no-color > plan.txt
# apply
terraform apply -auto-approve
# destroy
terraform destroy -auto-approve
```
