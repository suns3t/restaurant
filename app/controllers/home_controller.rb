class HomeController < ApplicationController
    def index
        
    end
    
    def menu
        @sections = %w(Breakfast Lunch Dinner Supper)
        
        if params['section'].present?
            @food_items = FoodItem.where(section: params['section'])
        else
            @food_items = FoodItem.all
        end
    end
    
    def contact_us
    end
end
