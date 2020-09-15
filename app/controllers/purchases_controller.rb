class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :user_is_seller, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]


  def index
    @purchase = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def user_is_seller
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out_item
    if  @item.purchase
      redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render "index"
    end

  end



  private
  
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefectures_id, :city, :house_number, :building_name, :tell, :user_id, :item_id, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
  item = Item.find(params[:item_id])
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: item.price,
    card: purchase_params[:token],
    currency: "jpy"
  )
  end
  


end
