class PropertyTypesController < ApplicationController
  before_action :set_property_type, only: %i[show update destroy]

  # GET /property_types
  def index
    @property_types = PropertyType.all

    render json: @property_types
  end

  # GET /property_types/1
  def show
    render json: @property_type
  end

  # POST /property_types
  def create
    @property_type = PropertyType.new(property_type_params)

    if @property_type.save
      render json: @property_type, status: :created, location: @property_type
    else
      render json: @property_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /property_types/1
  def update
    if @property_type.update(property_type_params)
      render json: @property_type
    else
      render json: @property_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /property_types/1
  def destroy
    @property_type.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property_type
    @property_type = PropertyType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_type_params
    params.require(:property_type).permit(:name, :description)
  end
end
