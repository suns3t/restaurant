class FoodItem < ActiveRecord::Base
    has_many :order_items
    
    validates :name, :description, :price, presence: true
    
    def image_url_or_default
        if image_url.present?
            image_url
        else
            "http://loremflickr.com/320/240/#{CGI.escape name}"
        end
    end
    
end
