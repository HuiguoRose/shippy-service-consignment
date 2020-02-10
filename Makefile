build:
	protoc -I. --go_out=plugins=micro:.  proto/consignment/consignment.proto
	docker build -t shippy-service-consignment .
run:
	docker run --net="host" --rm=true -e DISABLE_AUTH=true -e MICRO_REGISTRY=mdns -e MICRO_ADDRESS=":50051" -e DB_HOST="mongodb://localhost:27017" -p 50051:50051 shippy-service-consignment
