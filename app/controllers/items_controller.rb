class ItemsController < ApplicationController

  before_action :require_user, only: [:create, :destroy]

  def create
    @list = List.find_by(slug: params[:list_id])
    @item = @list.items.build(items_params)
    @item.creator = current_user

    if @item.save
      flash[:notice] = "#{@item.qty} #{@item.name} have been added to your list"
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :qty, :_destroy)
  end
end
