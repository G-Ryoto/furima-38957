class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show, ]
  before_action :set_item, only: [:edit,:update,:show,:destroy ]
  def index
    @item = Item.order("created_at DESC")
  
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  def show
  end 
  

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end


  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
     if current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to items_path
    end
  
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :product_explanation, :product_name, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])

  end

end
