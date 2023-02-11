Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })
  get("/add_photo", { :controller => "photos", :action => "add" })
  get("/update_photo/:photo_id", { :controller => "photos", :action => "update" })
  get("/add_comment/:photo_id", { :controller => "comments", :action => "add" })
end
