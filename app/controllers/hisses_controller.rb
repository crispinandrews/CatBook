  class HissesController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @post.hisses.create
    render json: {new_like_count: @post.likes.count - @post.hisses.count}
  end
end
