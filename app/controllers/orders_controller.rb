class OrdersController < ApplicationController
  def create
    @order = Order.new({name: order_params[:name]})
    respond_to do |format|
      unless @order.save
        format.html { redirect_to products_url, status: :conflict }
        format.json { render json: @order.errors, status: :conflict }
      else 
        params[:order][:products].each do |k,v|
          @line_item = LineItem.new({quantity: v, product_id: k, order_id: @order.id})
          @order.line_items << @line_item
        end
        if @order.valid_order
          @order.save
          @order.reduce_stock
          format.html { redirect_to products_url}
          format.json { render json: @order.errors, status: :created }
        else
          format.html { render :new, status: :conflict }
          format.json { render json: @order.errors, status: :conflict }
        end
      end
    end
    
  end

  def destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :products => {})
    end
end
