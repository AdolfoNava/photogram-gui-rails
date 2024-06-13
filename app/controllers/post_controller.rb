class PostController < ApplicationController
    def list
        @collection = Photo.all.order({:created_at => :desc})

        render({:template => "post_templates/display_all_photos"})
    end
    
    def display
        @photo = Photo.find(params["photo_id"])

        render({:template => "post_templates/selected_photo"})
    end

    def create
        @post = Photo.new
        @post.image = params["image_url"]
        @post.caption = params["caption"]
        @post.owner_id = params["owner_id"]
        
        if @post.valid?
            @post.save
            puts "Post created"
            redirect_to("/photos/#{@post.id}", :notice => "Post created")
        else
            redirect_to("/photos", :fail => "Post failed to be created")
        end
    end

    def update
        post = Photo.find(params["photo_id"])
        post.caption = params[:caption]
        post.image = params[:image_url]
        if user.valid?
            user.save
            flash[:success] = "User Updated."
            redirect_to("/users/#{user.id}", {:notice => "User updated successfully."})
        else
            redirect_to("/users/#{user.id}", {:fail => "User failed to update properly."})
        end
    end

    def destroy
        @photo = Photo.find(params[:id])
        if @photo.destroy
            flash[:success] = 'Photo was successfully deleted.'
            redirect_to("photos/")
        else
            redirect_to("photos/#{id}", {:fail => 'Photo failed to be successfully deleted.'})
        end
    end
    
end
