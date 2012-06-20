class HistoryController < ApplicationController
  before_filter :should_be_logged_in
  def revert
    @history = Version.find(params[:id])

    if @history.reify
      @history.reify.save!
      redirect_to :back, :notice => "Undid #{@history.event}. #{link(@history)}"
    else
      @history.item.destroy
      redirect_to new_page_path, :notice => "Undid #{@history.event}. #{link(@history)}"
    end
  end

  def link_name  
    params[:redo] == "true" ? "undo" : "redo"
  end
  
  def link(history)
    view_context.link_to(link_name, revert_history_path(history.next, :redo => !params[:redo]), :method => :post)
  end

end
