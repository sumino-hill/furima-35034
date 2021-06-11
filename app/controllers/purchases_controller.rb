class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path 
    else
      render :index
    end
  end

private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @items.id, token: params[:token] )
  end

  def set_purchase
    @items = Item.find(params[:item_id])
    if @items.user == current_user || @items.purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @items[:price],  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
