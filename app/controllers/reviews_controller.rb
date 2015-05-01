class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :delete]
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

  def edit
    @review = Review.find(params[:id])
    @band = Band.find(@review.reviewable_id)
  end

  def update
    @review = Review.find(params[:id])
    @band = Band.find(@review.reviewable_id)

    if @review.update(review_params)
      flash[:notice] = 'Review updated!'
      redirect_to band_path(@band)
    else
      flash[:alert] = @review.errors.full_messages
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @band = Band.find(@review.reviewable_id)
    if @review.destroy
      flash[:notice] = "Review deleted"
    end
      redirect_to band_path(@band)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
