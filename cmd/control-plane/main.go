package main

import (
	"log/slog"
	"os"
)

func main() {
	os.Exit(run())
}

func run() int {
	slog.Info("control-plane skeleton")
	return 0
}
