class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @dose = Dose.new
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render '../views/cocktails/show'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to cocktail_path(review.cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
