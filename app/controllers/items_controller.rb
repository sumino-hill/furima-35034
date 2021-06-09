class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:new]
  before_action :set_item, only: [:edit, :show,:update]

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
    @item.update(item_params)
    if @item.save
      render :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explain,:category_id,:state_id,:cost_id,:prefecture_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end

  def set_item
  @item = Item.find(params[:id])
  end
end
