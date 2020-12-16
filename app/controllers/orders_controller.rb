class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]

  def index
    if (current_user.id == @item.user_id) || (@item.order.present?)
      redirect_to root_path
    else
      @purchase_recode = PurchaseRecode.new
    end
  end

  def create
    @purchase_recode = PurchaseRecode.new(order_params)
    if @purchase_recode.valid?
      pay_item
      @purchase_recode.save
      redirect_to root_path
    else
      render :index
    end
  end
 
  private
  def order_params
   params.permit(:post_num, :prefecture_id, :banch, :city, :phone_num, :building_name)
         .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find_by(id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


end
