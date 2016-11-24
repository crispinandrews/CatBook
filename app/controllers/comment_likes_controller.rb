class CommentLikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.comment_likes.create
    redirect_to root_path
  end
end
