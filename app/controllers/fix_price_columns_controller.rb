class FixPriceColumnsController < ApplicationController
  before_action :set_fix_price_column, only: [:show, :update, :destroy]

  # GET /fix_price_columns
  def index
    @fix_price_columns = FixPriceColumn.all

    render json: @fix_price_columns
  end

  # GET /fix_price_columns/1
  def show
    render json: @fix_price_column
  end

  # POST /fix_price_columns
  def create
    @fix_price_column = FixPriceColumn.new(fix_price_column_params)

    if @fix_price_column.save
      render json: @fix_price_column, status: :created, location: @fix_price_column
    else
      render json: @fix_price_column.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fix_price_columns/1
  def update
    if @fix_price_column.update(fix_price_column_params)
      render json: @fix_price_column
    else
      render json: @fix_price_column.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fix_price_columns/1
  def destroy
    @fix_price_column.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fix_price_column
      @fix_price_column = FixPriceColumn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fix_price_column_params
      params.fetch(:fix_price_column, {})
    end
end
