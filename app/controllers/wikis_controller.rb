class WikisController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create

  def create
    @wiki = current_user.wikis.new
    @wiki.save!

    params[:id] = @wiki.id
    render :show
  end

  def show
  end

  def index
  end

  def update
    @wiki.update_attributes!(update_params)

    respond_to do |format|
      format.json { respond_with_bip(@wiki) }
    end
  end

  def destroy
    if @wiki.destroy
      flash[:success] = "\"#{@wiki.name}\" has been deleted"
      redirect_to root_path
    else
      flash[:alert] = "On snap! There was a problem deleting \"#{@wiki.name}\""
      render :show
    end
  end

  private

  def update_params
    params.require(:wiki).permit(:name)
  end
end
