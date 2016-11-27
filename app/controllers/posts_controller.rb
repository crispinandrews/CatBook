class PostsController < ApplicationController

  require 'pp'

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permisson, only: [:edit, :update, :destroy]

  def index
    @friends = []
    @posts_from_friends = []
    if current_user
      current_user.relations.each do |user|
        @friends << user
      end
      current_user.inverse_relations.each do |user|
        @friends << user
      end
      @friends << current_user
      get_friends_posts
    end
    @users = User.all
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

  def get_posts
    if current_user
      consolidate_friends
      @friends << current_user
      get_friends_posts
    end
  end

  def consolidate_friends
    @friends << current_user.relations
    @friends << current_user.inverse_relations
  end

  def get_friends_posts
    @friends.each do |friend|
      unless friend.posts.nil?
        friend.posts.each do |post|
          @posts_from_friends << post
        end
      end
      puts "****** BEFORE SORTING *******"
      pp @posts_from_friends
      @posts_from_friends = @posts_from_friends.sort_by { |m| [m.created_at, m.updated_at].max }.reverse!.take(3)
      puts "****** AFTER SORTING *******"
      pp @posts_from_friends
    end
  end
end
