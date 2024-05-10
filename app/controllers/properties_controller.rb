class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]

  def index
    @properties = Property.includes(:created_by, :property_type, :ownership_type)
    render json: @properties.as_json(
      include: {
        created_by: { only: [:id, :email] },
        property_type: { only: [:id, :name] },
        ownership_type: { only: [:id, :name] }
      }
    )
  end

  # GET /properties/1
  def show
    render json: @property.as_json(include: :images).merge(
      images: @property.images.map do |image|
        url_for(image)
      end
    )
  end

  # POST /properties
  def create
    @property = Property.new(property_params.except(:images))
    images = params[:property][:images]
    images&.each do |image|
      @property.images.attach(image)
    end
    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy!
  end

  private

  def attach_images(images)
    images.each do |image|
      @property.images.attach(image)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:title, :price, :no_of_rooms, :property_type_id, :ownership_type_id,
                                     :description, :created_by_id, :address, :no_of_bathrooms, images: [])
  end
end
