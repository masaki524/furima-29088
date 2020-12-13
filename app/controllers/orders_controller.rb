class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find_by(id: params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      @purchase_recode = PurchaseRecode.new
    end
  end

  def create
    @purchase_recode = PurchaseRecode.new(order_params)
    if @purchase_recode.valid?
      @purchase_recode.save
      redirect_to root_path
    else
      @item = Item.find_by(id: params[:item_id])
      render :index
    end
  end
 
  private
  def order_params
   params.permit(:post_num, :prefecture_id, :banch, :city, :phone_num, :building_name)
         .merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
