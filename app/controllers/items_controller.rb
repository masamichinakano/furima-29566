class ItemsController < ApplicationController
  before_action :move_to_new_user_session, except: [:index, :show]    
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  
  def index
    @items = Item.all.order("created_at DESC")
    # @item = PurchaseAddress.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
    
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :image, :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?   
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
