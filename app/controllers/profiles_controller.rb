class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!
  before_action :owned_profile, only: [:edit, :update]

  def show
    @friends = []
    if current_user
      consolidate_friends
    end
    @users = User.all
    @user = User.find_by(petname: params[:petname])
    @posts = User.find_by(petname: params[:petname]).posts.order('created_at DESC')
  end

  private

  def consolidate_friends
    current_user.relations.each do |user|
      @friends << user
    end
    current_user.inverse_relations.each do |user|
      @friends << user
    end
  end

  def set_user
    @user = User.find_by(petname: params[:petname])
  end

end
