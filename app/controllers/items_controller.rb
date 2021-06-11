class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_edit, only: [:edit, :update,:destroy]
  def index
    @items = Item.all.order("created_at ASC")
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
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image,:name,:explain,:category_id,:state_id,:cost_id,:prefecture_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end

  def set_item
  @item = Item.find(params[:id])
  end

  def set_edit
    if @item.user != current_user || @item.purchases.present?
      redirect_to root_path
    end
  end
end
