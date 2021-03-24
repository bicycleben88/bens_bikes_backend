class CartitemsController < ApplicationController
  before_action :set_cartitem, only: [:show, :update, :destroy]

  # GET /cartitems
  def index
    @cartitems = Cartitem.all

    render json: @cartitems.to_json(include: :item)
  end

  # GET /cartitems/1
  def show
    render json: @cartitem
  end

  # POST /cartitems
  def create
    if
      Cartitem.find_by(item_id: params[:item_id].to_i)
      @cartitem = Cartitem.find_by(item_id: params[:item_id].to_i)
      @cartitem.update(quantity: @cartitem.quantity + 1)
      render json: @cartitem
    else
      @cartitem = Cartitem.new(cartitem_params)
      if @cartitem.save
        render json: @cartitem, status: :created, location: @cartitem
      else
        render json: @cartitem.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /cartitems/1
  def update
    if @cartitem.update(cartitem_params)
      render json: @cartitem
    else
      render json: @cartitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cartitems/1
  def destroy
    @cartitem.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartitem
      @cartitem = Cartitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cartitem_params
      params.require(:cartitem).permit(:item_id, :user_id, :quantity)
    end
end
