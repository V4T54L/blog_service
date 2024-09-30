package main

import (
	"context"
	"log"

	"github.com/V4T54L/blog_service/api"
	"github.com/V4T54L/blog_service/config"
	"github.com/V4T54L/blog_service/store"
)

func main() {
	ctx := context.Background()
	cfg, err := config.Load()
	if err != nil {
		log.Fatal(err)
	}

	// store := store.NewMemoryMoviesStore()
	store := store.NewPostgresMoviesStore(cfg.DatabaseURL)
	server := api.NewServer(cfg.HTTPServer, store)
	server.Start(ctx)
}
