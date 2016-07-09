class OrderItemsController < ApplicationController
  
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_itmes_params) 
    @order.save
    session[:session_order_id] = @order.id
    flash[:notice] = "Your order is created!"
    redirect_to :back 
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_itmes_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    flash[:notice] = "It is removed from your order"
    redirect_to :back
  end
  
  private
    def order_itmes_params
      params.require(:order_item).permit(:quantity, :food_item_id)
    end
end
