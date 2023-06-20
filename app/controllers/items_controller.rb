class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:create,:index,:show,:edit,:update ]
  def index
    @item = Item.order("created_at DESC")
    #@items = Item.find(1)
    #@images = Image.all

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
    @item = Item.find(params[:id])
  end 
  
  def edit
    @item = Item.find(params[:id])
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :product_explanation, :product_name, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
