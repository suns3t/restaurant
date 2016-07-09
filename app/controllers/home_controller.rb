class HomeController < ApplicationController

    def index
    end
    
    def menu
        @sections = %w(Breakfast Lunch Dinner Drinks)
        @alphabet_orders = {'A to Z' => 'ASC', 'Z to A' => 'DESC'}
        @price_orders = {'Low to high' => 'ASC', 'High to low' => 'DESC'}
        @order_item = current_order.order_items.new
        
        if params['section'].present?
            @food_items = FoodItem.where(section: params['section'])
        else
            @food_items = FoodItem.all
        end
        
        if params['order'].present?
            @food_items = @food_items.order('name ' + params['order'])
        end
        
        if params['price'].present?
            @food_items = @food_items.order('price ' + params['price'])
        end
    end
    
    def contact_us
    end
    
    def order
        @order_items = current_order.order_items
    end
    
    def order_submitted
        # Display the order detail 
        @user_info = params.permit(:name, :phone, :address)
        @final_order = current_order
        
        #Clear current order
        # session[:session_order_id] = nil
        
        # Send email confimation
    end
end
