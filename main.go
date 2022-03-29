package main

import (
	"encoding/json"
	"net/http"
)

type Response struct {
	Status string `json:"status"`
}

func main() {
	http.HandleFunc("/heartbeat", heartbeat)
	http.ListenAndServe(":8080", nil)
}

func heartbeat(w http.ResponseWriter, r *http.Request) {
	m := Response{"200"}
	json, _ := json.Marshal(m)
	w.Header().Set("Content-Type", "application/json")
	w.Write(json)
	return
}
