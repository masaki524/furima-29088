class OrdersController < ApplicationController
  def index
    @item = Item.find_by(id: params[:item_id])
    @purchase_recode = PurchaseRecode.new
  end

  def create
    @purchase_recode = PurchaseRecode.new(order_params)
     if @purchase_recode.valid?
       @purchase_recode.save
       redirect_to action: :index
     else
       render action: :order
     end
  end
 
  private
  def order_params
   params.require(:purchase_recode).permit(:post_num, :prefecture_id, :banch, :city, :phone_num, :building_name)
         .merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
