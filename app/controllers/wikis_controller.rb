class WikisController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create

  def create
    @wiki = current_user.owned_wikis.new
    @wiki.save!
    redirect_to @wiki
  end

  def show
    if current_user
      @premium_wiki = current_user.owned_wikis.new(public: false)
    end
  end

  def collaborators
    @collaborations = @wiki.collaborations
    @new_collaboration = Collaboration.new(wiki_id: @wiki.id)
  end

  def index
  end

  def update
    @wiki.update_attributes!(update_params)

    respond_to do |format|
      format.json { respond_with_bip(@wiki) }
      format.html { redirect_to @wiki }
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
    params.require(:wiki).permit(:name, :public)
  end
end
