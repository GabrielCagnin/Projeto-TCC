class ZonesController < ApplicationController

  # GET /zone
  def show_all
    parent_facility_id = params[:facility_id]

    if parent_facility_id == nil
      render json: ('Include facility_id parameter in the request'), status: :not_acceptable
    elsif !Facility.where(id: parent_facility_id).exists?
      render json: ('Facility with id "'+parent_facility_id+'" do not exists'), status: :not_acceptable
    else
      render json: Facility.find(parent_facility_id).zones
    end


  end

  # POST /create_zone
  def create_zone
    @zone = Zone.new(zone_params)

    parent_facility = @zone.facility
    if @zone.facility_id == nil
      render json: ('The request must contain facility_id'), status: :not_acceptable
    elsif parent_facility == nil
      render json: ('Facility with id "'+@zone.facility_id+'" do not exists'), status: :not_acceptable
    else
      if parent_facility.zones.where(name: @zone.name).exists?
        render json: ('Zone name "'+@zone.name+'" already exists'), status: :not_acceptable
      elsif @zone.name.blank?
        render json: ('Zone name can not be blank'), status: :not_acceptable
      else
        if @zone.save
          render json: @zone, status: :created
        else
          render json: @zone.errors, status: :unprocessable_entity
        end
      end
    end

  end

  def delete_zone
    @zone = Zone.find(params[:id])
    if @zone.delete
      render ('Zone '+@zone.name+' was deleted.')
    else
      render ('Zone could not be deleted.')
    end
  end

  def clear_zone
    if Zone.find(params[:id]).acquisitions.delete_all
      render ('Zone '+@zone.name+' was cleared.')
    else
      render ('Zone could not be cleared.')
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def zone_params
    params.require(:zone).permit(:name, :facility_id)
  end
end
