class WikisController < ApplicationController

  def new
    @wiki = current_user.wikis.new
    @wiki.save!

    params[:id] = @wiki.id
    redirect_to @wiki
  end

  def show
    @wiki = Wiki.find(params[:id])
    @pages = @wiki.pages
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes!(wiki_params)

    respond_to do |format|
      format.json { respond_with_bip(@wiki) }
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:name)
  end
end
