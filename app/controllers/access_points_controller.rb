class AccessPointsController < ApplicationController

  def show_all

    if params[:zone_id] != nil and params[:acquisition_id] != nil
      render json: 'The request should not have zone_id and acquisition_id simultaneously.',
             status: :unprocessable_entity

    elsif params[:zone_id] != nil
      @access_points = Zone.find(params[:zone_id]).access_points
      render json: @access_points, status: :ok

    elsif params[:acquisition_id] != nil
      @access_points = Acquisition.find(params[:acquisition_id]).access_points
      render json: @access_points, status: :ok

    else
      render json: 'You need a zone_id or a acquisition_id',
             status: :unprocessable_entity

    end
  end

  def access_point_params
    params.require(:access_point).permit(:id, :zone_id, :acquisition_id, :BSSID, :RSSI)
  end
end
