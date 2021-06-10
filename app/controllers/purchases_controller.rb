class PurchasesController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
  end
  
  def create
  end

private

  def purchase_params
    params.require(:item).permit(:image,:name,:explain,:category_id,:state_id,:cost_id,:prefecture_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end
end
