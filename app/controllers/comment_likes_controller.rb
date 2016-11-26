class CommentLikesController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!

  # def new
  #   @comment = Comment.find(params[:comment_id])
  #   @comment_like = CommentLike.new
  # end

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.comment_likes.create
    render json: {new_comment_likes_count: @comment.comment_likes.count}
  end
end
