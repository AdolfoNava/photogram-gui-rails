class CommentController < ApplicationController
  def create
    comment = Comment.new

    comment.photo_id = params["photo_id"]
    comment.author_id = params["author_id"]
    comment.body = params["comment"]

    if comment.valid?
      comment.save
      flash[:success] = "User created."
      redirect_to("/photos/#{comment.photo_id}", {:notice => "User created successfully."})
  else
      flash[:notice] = "Failed to have added a new comment."
      redirect_to("/photos/#{comment.photo_id}", {:notice => "User failed to be created properly."})
  end
  end
end
