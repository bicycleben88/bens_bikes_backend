class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders.to_json(include: :order_items)
  end

  # GET /orders/1
  def show
    render json: @order.to_json(include: :order_items)
  end

  # POST /orders
  def create
    @user = User.find(params[:user_id].to_i)
    @order = Order.new(order_params)
    @total = 0

    if @order.save
       @user.cartitems.map{|cartitem| 
         @order_item = OrderItem.create({
            order_id: @order.id,
            name: cartitem.item.name,
            image: cartitem.item.image,
            description: cartitem.item.description,
            price: cartitem.item.price,
            quantity: cartitem.quantity
          })
        @total += @order_item.price * cartitem.quantity
        @order.update(order_items_id: @order_item.id, total: @total)
        Cartitem.delete(cartitem.id)
      }

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
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:id, :created_at, :updated_at, :user_id, :order_items_id)
    end
end
