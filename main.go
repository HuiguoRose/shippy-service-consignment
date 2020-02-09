// shippy-service-consignment/main.go
package main

import (
	"context"
	"fmt"
	pb "github.com/HuiguoRose/shippy-service-consignment/proto/consignment"
	vesselProto "github.com/HuiguoRose/shippy-service-vessel/proto/vessel"
	"github.com/micro/go-micro"
	"log"
	"os"
)

const (
	defaultHost = "datastore:27017"
)

func main() {

	// Create a new service. Optionally include some options here.
	srv := micro.NewService(

		// This name must match the package name given in your protobuf definition
		micro.Name("shippy.service.consignment"),
	)

	// Init will parse the command line flags.
	srv.Init()

	uri := os.Getenv("DB_HOST")
	if uri == "" {
		uri = defaultHost
	}

	client, err := CreateClient(context.Background(), uri, 0)
	if err != nil {
		log.Panic(err)
	}
	defer client.Disconnect(context.Background())

	consignmentCollection := client.Database("shippy").Collection("consignments")

	repository := &MongoRepository{consignmentCollection}

	vesselClient := vesselProto.NewVesselServiceClient("shippy.service.vessel", srv.Client())
	// Register handler
	pb.RegisterShippingServiceHandler(srv.Server(), &handler{
		repository:   repository,
		vesselClient: vesselClient,
	})

	// Run the server
	if err := srv.Run(); err != nil {
		fmt.Println(err)
	}
}
