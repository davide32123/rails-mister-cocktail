class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      @review = Dose.new
      redirect_to cocktail_path(@cocktail)
    else
      render './cocktails/show'
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
