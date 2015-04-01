class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lists = List.where("user_id = ?", current_user).reverse_order
  end

  def show
    @item = Item.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.creator = current_user

    if @list.save
      flash[:notice] = 'Your list has been created'
      redirect_to root_path
    else
      flash[:error] = 'There was a problem, please try again'
      render 'new'
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      flash[:notice] = 'Your list has been updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find_by(slug: params[:id])
  end

  def list_params

    params.require(:list).permit(:name, :description, items_attributes: [:id, :_destroy])
  end

end
