class LikesController < ApplicationController
  respond_to :html, :js

  # def new
  #   @post = Post.find(params[:post_id])
  #   @like = Like.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)
    render json: {new_like_count: @post.likes.count - @post.hisses.count}
  end
end
