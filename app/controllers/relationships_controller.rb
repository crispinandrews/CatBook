class RelationshipsController < ApplicationController

  def create
    @relationship = current_user.relationships.new(relation_id: params[:relation_id])
    if @relationship.save
      flash[:notice] = "Added friend."
      redirect_to posts_path
    else
      if @relationship.errors.any?
        @relationship.errors.each do |error|
          puts error
        end
      end
      flash[:error] = "Unable to add friend."
      redirect_to posts_path
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to profile_path(current_user.petname)
  end

end
