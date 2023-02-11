class CommentsController < ApplicationController
  def add
    # {"photo_id"=>"765", "author_id"=>"117", "comment"=>"Nice photo bro", "controller"=>"comments", "action"=>"add"}
    photo_id = params.fetch("photo_id")
    author_id = params.fetch("author_id")
    body = params.fetch("body")

    comment = Comment.new
    comment.body = body
    comment.author_id = author_id
    comment.photo_id = photo_id
    comment.save
    redirect_to("/photos/" + photo_id.to_s)
  end
end
