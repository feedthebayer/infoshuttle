class PagesController < ApplicationController

  def new
    @page = Wiki.find(params[:wiki_id]).pages.new
    @page.save!

    params[:id] = @page.id
    redirect_to [@page.wiki, @page]
  end

  def show
    redirect_to user_path(current_user) if current_user && params[:id].blank?
    if params[:id] == 'landing'
      render 'landing'
    else
      @page = Page.find(params[:id])
    end
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes!(page_params)

    respond_to do |format|
      format.json { respond_with_bip(@page) }
    end
  end

  def destroy
    @page = Page.find(params[:id])

    if @page.destroy
      flash[:success] = "\"#{@page.title}\" has been deleted"
      redirect_to @page.wiki
    else
      flash[:alert] = "On snap! There was a problem deleting \"#{@page.title}\""
      render :show
    end
  end


  private

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
