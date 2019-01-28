class Api::V1::ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: [:show, :update, :destroy]

  # GET /reimbursements
  def index
    @reimbursements = Reimbursement.all

    render json: @reimbursements
  end

  # GET /reimbursements/1
  def show
    render json: @reimbursement
  end

  # POST /reimbursements
  def create
    @reimbursement = Reimbursement.new(reimbursement_params)

    if @reimbursement.save
      render json: @reimbursement, status: :created, location: @reimbursement
    else
      render json: @reimbursement.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /reimbursements/1
  # def update
  #   if @reimbursement.update(reimbursement_params)
  #     render json: @reimbursement
  #   else
  #     render json: @reimbursement.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /reimbursements/1
  # def destroy
  #   @reimbursement.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_reimbursement
  #     @reimbursement = Reimbursement.find(params[:id])
  #   end

    # Only allow a trusted parameter "white list" through.
    def reimbursement_params
      params.require(:reimbursement).permit(:purpose, :cost, :employee_id)
    end
end
