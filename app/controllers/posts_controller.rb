class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post saved successfully'
			redirect_to posts_path
		else
      flash[:notice] = 'Post did not save'
			render 'new'
		end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
