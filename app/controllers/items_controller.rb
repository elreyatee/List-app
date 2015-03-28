class ItemsController < ApplicationController

  before_action :require_user, only: [:create, :destroy]

  def create
    @list = List.find_by(params[:list_id])
    @item = @list.items.build(params.require(:item).permit(:name, :description, :qty))
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
end
