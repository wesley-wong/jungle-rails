class ReviewsController < ApplicationController

def create

    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to [@product], notice: 'Product created!'
    else
      redirect_to [@product], notice: 'Product created!'
    end
  end


  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end
    private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
