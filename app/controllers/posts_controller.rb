class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permisson, only: [:edit, :update, :destroy]


# create an array of all the user's relations DONE
# add in all the user's inverse relations DONE
# find all the posts from users with those IDs

#Post.all.find post.user == (current_user.relation || current_user.inverse_relation)

  def index
    @posts_from_friends = []
    # get_friends_posts
    @users = User.all
    @posts = Post.all.order("created_at DESC")
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = 'Post did not save'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def get_friends_posts
    if current_user
      friends = current_user.relations
      friends << current_user.inverse_relations
      # friends << current_user
      friends.each do |friend|
        @posts_from_friends << Post.find_by(user_id: friend.id)
      end
    end
  end

  def post_params
    params.require(:post).permit(:text, :image)
  end

  def require_permisson
    post = Post.find(params[:id])
    if current_user != post.user
      flash[:notice] = 'You are not the owner of this post'
      redirect_to posts_path
    end
  end
end
