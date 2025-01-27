# RIPv1を使ったネットワーク構築

## ネットワーク構成図

```plantuml
startuml

nwdiag {

    network Internal {
        address = "192.168.0.0/24";
        web [address = "192.168.0.1"];
        nas [address = "192.168.0.2"];
    }
}
@enduml
```
