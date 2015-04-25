class CollaborationsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = @wiki.collaborations.new(
                        user_id: params[:collaboration][:user_id])

    if @collaboration.save
      flash[:success] = "#{@collaboration.user.username} is now a collaborator"
    else
      flash[:success] = "#{@collaboration.user.username} is already a collaborator"
    end
      redirect_to :back
  end

  def destroy
    @wiki = @collaboration.wiki
    @user = @collaboration.user

    if @collaboration.destroy
      flash[:success] = "#{@user.username} is no longer a collaborator"
    else
      flash[:alert] = "On snap! There was a problem removing #{@user.username}"
    end
    redirect_to :back
  end
end
