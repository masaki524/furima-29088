class ItemsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end
  
  private

  def item_params
    params.require(:item)
          .permit(:image, :name, :detail, :price, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_date_id )
          .merge(user_id: current_user.id)
  end
end
