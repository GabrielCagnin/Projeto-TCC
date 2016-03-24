class ZonesController < ApplicationController
  before_action :set_zone, only: [:update, :destroy]

  # GET /zones/facility/:facility_id
  def show_facility_zones
    facility = Facility.find(params[:facility_id])
    zones = facility.zones

    render json: zones
  end


  # POST /zones
  def create
    zone = Zone.new(zone_params)
    facility_id=zone_params[:facility_id]
    if Facility.find(facility_id).empty?
      render body: 'Facility id '+facility_id.to_s+' does not exist'
    else
      if Zone.where(name: zone_params[:name]).empty?
        if zone.save
          render body: "Zone '"+zone.name+"' was created.", status: :created
        else
          render body: 'Error: zone was not created', status: :unprocessable_entity
        end
      else
        render body: "Zone '"+zone.name+"' already exists."
      end
    end
  end

  # PATCH/PUT /zones/1
  def update
    zone = Zone.new(zone_params)
    if zone.update(zone_params)
      render json: zone
    else
      render json: zone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zones/1
  def destroy
    zone = Zone.new(zone_params)
    zone.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
    def zone_params
      params.require(:zone).permit(:name, :facility_id)
    end
end
