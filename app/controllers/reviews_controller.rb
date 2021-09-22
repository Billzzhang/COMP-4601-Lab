class ReviewsController < ApplicationController
  before_action :set_product, only: %i[ index ]
  def index
    @reviews = @product.reviews
    respond_to do |format|
      format.html { render :index, status: :ok }
      format.json { render json: @reviews, status: :ok }
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @product.reviews_will_change!
    puts @product.name
    @product.reviews << params[:rating].to_i
    respond_to do |format|
      if @product.save!
        format.html { redirect_to product_reviews_url}
        format.json { render :index, status: :created, location: @reviews }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end
    # Only allow a list of trusted parameters through.
    def reviews_params
      params.permit(:rating, :product_id)
    end
end
