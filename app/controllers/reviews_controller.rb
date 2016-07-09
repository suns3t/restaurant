class ReviewsController < ApplicationController
  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @review = @food_item.reviews.new(review_params)
    
    if @review.save
      redirect_to menu_path, notice: "Comment was created sucessfully."
    else
      redirect_to root_path, notice: "Comment should not be empty."
    end
  end
  
  private
    def review_params
      params.require(:review).permit(:score, :food_item_id, :comment)
    end
end
