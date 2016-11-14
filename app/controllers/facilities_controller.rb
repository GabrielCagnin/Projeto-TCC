class FacilitiesController < ApplicationController

  # GET /facilities
  def show_all
    render json: current_user.facilities
  end

  # POST /create_facility
  # POST /create_facility.json
  def create_facility
    @facility = Facility.new(facility_params)
    @facility.user_id = current_user.id

    if Facility.where(name: @facility.name).exists?
      render json: ('Facility name "'+@facility.name+'" already exists'), status: :not_acceptable
    elsif @facility.name.blank?
      render json: ('Facility name can not be blank'), status: :not_acceptable
    else
      if @facility.save
        render json: @facility, status: :created
      else
        render json: @facility.errors, status: :unprocessable_entity
      end
    end

  end

  def delete_facility
    @facility = Facility.find(params[:id])
    if @facility.delete
      render json: ('Facility '+@facility.name+' was deleted.')
    else
      render json: ('Facility could not be deleted.')
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def facility_params
    params.require(:facility).permit(:name)
  end
end
