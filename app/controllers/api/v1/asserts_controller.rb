class Api::V1::AssertsController < ApplicationController
  before_action :set_assert, only: [:show, :update, :destroy]

  # GET /asserts
  def index
    @asserts = Assert.all

    render json: @asserts
  end

  # GET /asserts/1
  def show
    render json: @assert
  end

  # POST /asserts
  def create
    @assert = Assert.new(assert_params)

    if @assert.save
      render json: {message: 'success'}
    else
      render json: {message: 'failed'}
    end
  end

  # PATCH/PUT /asserts/1
  # def update
  #   if @assert.update(assert_params)
  #     render json: @assert
  #   else
  #     render json: @assert.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /asserts/1
  # def destroy
  #   @assert.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_assert
  #     @assert = Assert.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
   def assert_params
      params.require(:assert).permit(:item_name, :item_price, :company_id)
    end
end
