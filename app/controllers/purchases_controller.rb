class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase
  def index
    @purchase_address = PurchaseAddress.new
    if @items.user == current_user
      redirect_to root_path
    elsif @items.purchases.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @items.id)
  end

  def set_purchase
    @items = Item.find(params[:item_id])
  end
end
