Rails.application.routes.draw do

    get("/", :controller => "user", 
    :action => "list")
    get("/users", :controller => "user", 
    :action => "list")
    get("/users/:username", :controller => "user", :action => "display")
    post("/add_user", :controller => "user", :action => "create")
    post("/update_user/:path_id", :controller => "user", :action => "update")

    get("/photos", :controller => "post", :action => "list")
    get("/photos/:photo_id", :controller => "post", :action => "display")
    post("/create_photo_record", :controller => "post", :action => "create")
    post("/modify_photo_record/:photo_id", :controller => "post", :action => "update")
    get("/delete_photo/:photo_id", :controller => "post", :action => "destroy")
    post("/add_comment", :controller => "comment", :action => "create")
end
