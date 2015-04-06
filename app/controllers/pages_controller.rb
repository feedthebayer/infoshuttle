class PagesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create

  def create
    @page = Wiki.find(params[:wiki_id]).pages.new
    @page.save!

    params[:id] = @page.id
    redirect_to [@page.wiki, @page]
  end

  def show
  end

  def update
    @page.update_attributes!(update_params)

    respond_to do |format|
      format.json { respond_with_bip(@page) }
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = "\"#{@page.title}\" has been deleted"
      redirect_to @page.wiki
    else
      flash[:alert] = "On snap! There was a problem deleting \"#{@page.title}\""
      render :show
    end
  end


  private

  def update_params
    params.require(:page).permit(:title, :content)
  end
end
