class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def count 
    @count = Item.count
    render json: @count
  end

  def index
    @items = Item.find_each(start: params[:start].to_i, finish: params[:finish].to_i)
    render json: @items
  end

  def show
    render json: @item
  end

  def destroy
    @item.destroy
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

end
