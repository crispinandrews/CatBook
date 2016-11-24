class LikesController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    render json: {new_like_count: @post.likes.count}
  end
end
