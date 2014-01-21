class PagesController < ApplicationController
  def index
    @q = Page.search(params[:q])
    @pages = @q.result(distinct: true)
    @grouped = @pages.group_by { |p| p.group_id }.values
  end

  def show
    @page = Page.find(params[:id])
    @group = Group.find(@page.group_id) rescue nil
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to page_path(@page), :notice => "page saved"
    else
      redirect_to new_page_path, :notice => "page not saved" 
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to page_path(@page), :notice => "page saved #{undo_link(@page)}"
    else
      redirect_to new_page_path, :notice => "page not saved" 
    end
  end

  def destroy
    @page = Page.find(params[:id])
    if @page.destroy
      redirect_to root_path, :notice => "page deleted"
    else
      redirect_to root_path, :notice => "page not deleted"
    end
  end

  def history
    @page = Page.find(params[:id])
    @versions = @page.versions
  end

  def revert
    @page = Page.find(params[:id])

    @page = @page.previous_version

    if @page.save
      redirect_to page_path(@page), :notice => "Undid changes"
    else
      redirect_to page_path(@page), :notice => "Failed to undo changes"
    end
  end

  private

  def undo_link(page)
    view_context.link_to("undo", revert_page_path(page))
  end
end
