class ReviewsController < ApplicationController
  def create
    @review_object = Review.derive_reviewable(params)
    @review = @review_object.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "Successfully created review"
    else
      flash[:alert] = "Error"
    end
    redirect_to @review_object
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
