class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      @page.add_tags(params[:tags])
      redirect_to page_path(@page), :notice => "page saved #{undo_link}"
    else
      redirect_to new_page_path, :notice => "page not saved" 
    end
  end

  def edit
    @page = Page.find(params[:id])
    @tags = ""
    @page.tags.each do |t|
      @tags << t.tag_name
      @tags << " "
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      @page.delete_tags
      @page.add_tags(params[:tags])
      redirect_to page_path(@page), :notice => "page saved #{undo_link}"
    else
      redirect_to new_page_path, :notice => "page not saved" 
    end
  end

  def destroy
    @page = Page.find(params[:id])
    if @page.destroy
      redirect_to root_path, :notice => "page deleted #{undo_link}"
    else
      redirect_to root_path, :notice => "page not deleted"
    end
  end

  private

  def undo_link
    view_context.link_to("undo", revert_history_path(@page.versions.scoped.last), :method => :post)
  end
end
