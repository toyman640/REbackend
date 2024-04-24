class OwnershipTypesController < ApplicationController
  before_action :set_ownership_type, only: %i[ show update destroy ]

  # GET /ownership_types
  def index
    @ownership_types = OwnershipType.all

    render json: @ownership_types
  end

  # GET /ownership_types/1
  def show
    render json: @ownership_type
  end

  # POST /ownership_types
  def create
    @ownership_type = OwnershipType.new(ownership_type_params)

    if @ownership_type.save
      render json: @ownership_type, status: :created, location: @ownership_type
    else
      render json: @ownership_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ownership_types/1
  def update
    if @ownership_type.update(ownership_type_params)
      render json: @ownership_type
    else
      render json: @ownership_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ownership_types/1
  def destroy
    @ownership_type.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ownership_type
      @ownership_type = OwnershipType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ownership_type_params
      params.require(:ownership_type).permit(:name, :description)
    end
end
