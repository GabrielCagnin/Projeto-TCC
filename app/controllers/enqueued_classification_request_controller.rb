class EnqueuedClassificationRequestController < ApplicationController

  # POST /classify_zone
  def enqueue_acquisition
    @request = EnqueuedClassificationRequest.new(request_params)
    @request.facility = Facility.find_by(id: request_params[:facility_id])

    if @request.save
      render json: {status: 'Your request was enqueued'}, status: :created
    else
      render json: @request.errors
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.permit(:facility_id, {access_points: [:BSSID, :RSSI]})
  end
end