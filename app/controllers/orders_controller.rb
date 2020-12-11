class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders.to_json(include: :cartitems)
  end

  # GET /orders/1
  def show
    render json: @order.to_json(include: :cartitems)
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    if @order.cartitems.length > 0
      @order.cartitems.each{ |item|  
        Cartitem.find(item.id).destroy
      }
    end
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:id, :created_at, :updated_at, :user_id)
    end
end
