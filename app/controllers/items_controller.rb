class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @user = User.find(params[:user_id])
    @item = @room.items.new(item_params)
    @item.save
  end

  def new
    @item = Item.new
  end

  private

  def items_params
    params.require(:item).permit(:content, :category_id).merge(user_id: current_user.id)
  end
end
