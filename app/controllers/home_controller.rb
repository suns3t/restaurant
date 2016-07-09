class HomeController < ApplicationController

    def index
    end
    
    def menu
        @sections = %w(Breakfast Lunch Dinner Drinks)
        @alphabet_orders = {'Sort from A to Z' => 'ASC', 'Sort from Z to A' => 'DESC'}
        @price_orders = {'Sort from low to high' => 'ASC', 'Sort from high to low' => 'DESC'}
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
end
