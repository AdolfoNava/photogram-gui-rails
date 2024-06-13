class UserController < ApplicationController
    def list
        render({:template => "user_templates/display_all_users"})
    end
    def display
        @name = params["username"]
        @user = User.where(:username => @name).first
        render({:template => "user_templates/selected_user"})
    end
    def create
        user = User.new
        user.username = params["add_username"]

        if user.valid?
            user.save
            flash[:success] = "User created."
            redirect_to("/users/#{user.username}", {:notice => "User created successfully."})
        else
            flash[:notice] = "Failed to have a user between 3-25 characters"
            redirect_to("/users", {:notice => "User failed to be created properly."})
        end
    end
    def update
        id = params["path_id"]
        
        user = User.find(id)
        user.username = params["username"]
        if user.valid?
            user.save
            flash[:success] = "User Updated."
            redirect_to("/users/#{user.username}", {:notice => "User updated successfully."})
        else
            redirect_to("/users/#{user.username}", {:notice => "User failed to update properly."})
        end
    end
end
