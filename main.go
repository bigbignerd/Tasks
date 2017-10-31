package main

import (
	"log"
	"net/http"
)

func main() {
	PORT := "127.0.0.1:8080"
	http.HandleFunc("/complete/", CompleteTaskFunc)
	http.HandleFunc("/delete/", DeleteTaskFunc)
	http.HandleFunc("/deleted/", ShowTrashTaskFunc)
	http.HandleFunc("/trash/", TrashTaskFunc)
	http.HandleFunc("/edit/", EditTaskFunc)
	http.HandleFunc("/completed/", ShowCompleteTasksFunc)
	http.HandleFunc("/restore/", RestoreTaskFunc)
	http.HandleFunc("/add/", AddTaskFunc)
	http.HandleFunc("/update/", UpdateTaskFunc)
	http.HandleFunc("search/", SearchTaskFunc)
	http.HandleFunc("/login/", GetLogin)
	http.HandleFunc("/register/", PostRegister)
	http.HandleFunc("/admin/", HandleAdmin)
	http.HandleFunc("/add_user/", PostAddUser)
	http.HandleFunc("/change", PostChange)
	http.HandleFunc("/logout", HandleLogout)
	http.HandleFunc("/", ShowAllTasksFunc)

	http.Handle("/static/", http.FileServer(http.Dir("public")))

	log.Print("Running server on " + PORT)
	log.Fatal(http.ListenAndServe(PORT, nil))
}

func CompleteTask(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(r.URL.Path))
}
