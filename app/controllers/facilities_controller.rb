class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:update, :destroy]

  # GET /facilities/:user_id
  def index
    @user= User.find(params[:user_id])
    @facilities = @user.facilities

    render json: @facilities
  end



  # POST /facilities
  def create
    @facility = Facility.new(facility_params)
    if Facility.where(name: facility_params[:name]).empty?
      if @facility.save
        render body: 'Error: facility was not created', status: :created
      else
        render json: @facility.errors, status: :unprocessable_entity
      end
    else
      render body: "Facility '"+@facility.name+"' already exists."
    end


  end

  # PATCH/PUT /facilities/1
  def update
    if @facility.update(facility_params)
      render json: @facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  # DELETE /facilities/1
  def destroy
    @facility.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
    def facility_params
      params.require(:facility).permit(:name)
    end
end
