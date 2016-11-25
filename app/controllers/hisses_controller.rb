  class HissesController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @post.hisses.create(user: current_user)
    render json: {new_hiss_count: @post.hiss.count}
  end
end
