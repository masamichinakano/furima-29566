class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :user_is_seller, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]


  def index
    @purchase = Purchase.new
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
  end


end
