module github.com/HuiguoRose/shippy-service-consignment

go 1.13

replace sigs.k8s.io/yaml => github.com/kubernetes-sigs/yaml v1.1.0

require (
	github.com/HuiguoRose/shippy-service-user v0.0.2
	github.com/HuiguoRose/shippy-service-vessel v0.0.2
	github.com/golang/protobuf v1.3.3
	github.com/micro/go-micro/v2 v2.0.0
	github.com/pkg/errors v0.9.1
	go.mongodb.org/mongo-driver v1.3.0
)
