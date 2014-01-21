class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to root_path, notice: 'Group Created'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to root_path, notice: 'Group Saved'
    else
      render :edit
    end
  end

end
