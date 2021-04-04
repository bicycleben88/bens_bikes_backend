class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all

    render json: @orders.to_json(include: :order_items)
  end

  def show
    render json: @order.to_json(include: :order_items)
  end

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

      @charge = Stripe::PaymentIntent.create({
        amount: @order.total,
        currency: "USD",
        confirm: true,
        payment_method: params[:stripe_token],
      })

      @order.update(charge: @charge.id)
      
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private
  
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:id, :created_at, :updated_at, :user_id, :order_items_id)
    end
end
