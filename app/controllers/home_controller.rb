class HomeController < ApplicationController

    def index
    end
    
    def menu
        @sections = %w(Breakfast Lunch Dinner Drinks)
        @alphabet_orders = {'A to Z' => 'ASC', 'Z to A' => 'DESC'}
        @price_orders = {'Low to high' => 'ASC', 'High to low' => 'DESC'}
        @order_item = current_order.order_items.new
        

        @food_items = FoodItem.all
        
        if params['order'].present?
            @food_items = @food_items.order('name ' + params['order'])
        end
        
        if params['price'].present?
            @food_items = @food_items.order('price ' + params['price'])
        end
    end
    
    def contact_us
    end
    
    def search
        @order_item = current_order.order_items.new

        # Search case insensitive
        @food_items = FoodItem.where("LOWER(name) LIKE ?", "%#{params[:q].downcase}%")
    end
    def order
        @order_items = current_order.order_items
    end
    
    def order_submitted
        # Display the order detail 
        @user_info = params.permit(:name, :phone, :address, :email)
        @final_order ||= current_order
        
        #Clear current order
        session[:session_order_id] = nil

        begin
            # Tell the UserMailer to send a welcome email after save
            UserMailer.confirmation_order(@user_info).deliver_now
            
            # Notify
            flash[:notice] = "A confirmation email is sent"
        rescue Exception => e
            flash[:notice] = "Something goes wrong. A confirmation email is not sent"
        end
            
    end
end
