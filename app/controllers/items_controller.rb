class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]  


  def index
  end
  
  def new
    @items = Item.new
  end

  def create
    binding.pry
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :text, :image, :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
