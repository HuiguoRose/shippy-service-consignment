build-protoc:
	protoc -I. --micro_out=. --go_out=.  proto/consignment/consignment.proto
build:
	docker build -t shippy-service-consignment .
run:
	docker run --link shippy-service-user --link mongo \
			--link shippy-service-vessel \
 			--rm=true -e DISABLE_AUTH=true -e MICRO_REGISTRY=mdns \
 			-e MICRO_ADDRESS=":50051" -e DB_HOST="mongodb://mongo:27017" \
 			--name shippy-service-consignment \
 			 shippy-service-consignment
