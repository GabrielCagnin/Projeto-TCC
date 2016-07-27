class ZonesController < ApplicationController
  before_action :set_facility, only: [:show]

  # GET /zone
  def show_all
    render json: @parent_facility.zones
  end

  # POST /create_zone
  def create_zone
    @zone = Zone.new(zone_params)

    @parent_facility = @zone.facility

    if @parent_facility == nil
      render json: ('Facility with id "'+@zone.facility_id+'" do not exists'), status: :not_acceptable
    else
      if @parent_facility.zones.where(name: @zone.name).exists?
        render json: ('Zone name "'+@zone.name+'" already exists'), status: :not_acceptable
      else
        if @zone.save
          render json: @zone, status: :created
        else
          render json: @zone.errors, status: :unprocessable_entity
        end
      end
    end


  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_facility
    @zone = Zone.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def zone_params
    params.require(:zone).permit(:name, :facility_id)
  end
end
