class AccessPointsController < ApplicationController
  before_action :set_access_point, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:create]
######

  def show_measure_access_points
    measure=Measure.find_by_id(params[:measure_id])
    access_points=measure.access_points
    render json: access_points
  end

# POST /measures
  def create
    access_point = AccessPoint.new(access_point_params)
    measure_id=access_point_params[:measure_id]
    if Measure.find_by_id(measure_id)
      if access_point.save
        render body: 'Access Point was created.', status: :created
      else
        render body: 'Error: access point was not created', status: :unprocessable_entity
      end
    else
      render body: 'Measure with id '+measure_id.to_s+' does not exist'
    end
  end

########
# PATCH/PUT /access_points/1
  def update
    if @access_point.update(access_point_params)
      render json: @access_point
    else
      render json: @access_point.errors, status: :unprocessable_entity
    end
  end

# DELETE /access_points/1
  def destroy
    @access_point.destroy
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_access_point
    @access_point = AccessPoint.find(params[:id])
  end

# Only allow a trusted parameter "white list" through.
  def access_point_params
    params.require(:access_point).permit(:ssid, :bssid, :rssi, :measure_id)
  end
end
