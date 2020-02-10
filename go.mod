module github.com/HuiguoRose/shippy-service-consignment

go 1.13

require (
	github.com/HuiguoRose/shippy-service-user v0.0.0-20200209064458-306ee3b897f6
	github.com/HuiguoRose/shippy-service-vessel v0.0.0-20200208052111-426327330988
	github.com/golang/protobuf v1.3.3
	github.com/micro/go-micro v1.18.0
	github.com/pkg/errors v0.8.1
	go.mongodb.org/mongo-driver v1.3.0
	golang.org/x/net v0.0.0-20200202094626-16171245cfb2
)

replace sigs.k8s.io/yaml => github.com/kubernetes-sigs/yaml v1.1.0
