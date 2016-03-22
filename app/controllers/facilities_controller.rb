class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:update, :destroy]

  # GET /facilities/user/:user_id
  def show_user_facilities
    user= User.find(params[:user_id])
    facilities = user.facilities
    render json: facilities
  end



  # POST /facilities
  def create
    user_id=facility_params[:facilities_users_attributes].first[:user_id]
    if user_id.nil?
      render body: 'No user id'
    else
      if User.find_by_id(user_id)
        facility = Facility.new(facility_params)
        if Facility.where(name: facility_params[:name]).empty?
          if facility.save
            render body: "Facility '"+facility.name+"' was created.", status: :created
          else
            render json: 'Error: facility was not created', status: :unprocessable_entity
          end
        else
          render body: "Facility '"+facility.name+"' already exists."
        end
      else
        render body: 'User id '+user_id.to_s+' does not exist'
      end
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
      params.require(:facility).permit(:name, facilities_users_attributes: [:user_id])
    end
end
