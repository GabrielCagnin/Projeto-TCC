class AcquisitionSetsController < ApplicationController
  before_action :set_acquisition_set, only: [:show]

  def show
    render json: @acquisition_set
  end


  # It must create new entries for all the sub-nested resources (points and its access points)
  def create_set

    # Nested params is not working in the way it should (I blame mongoid)
    # The solution is to assign each attribute individually
    @acquisition_set = AcquisitionSet.new

    # AcquisitionSet parameters
    @acquisition_set.zone_id = acquisition_set_params[:zone_id]
    @acquisition_set.normalization_algorithm = acquisition_set_params[:normalization_algorithm]
    @acquisition_set.time_interval = acquisition_set_params[:time_interval]
    @acquisition_set.measures_per_point = acquisition_set_params[:measures_per_point]

    # Tries to save @acquisition_set. If fails, render error and return
    unless @acquisition_set.save
      render json: @acquisition_set.errors, status: :unprocessable_entity
      return
    end


    # Acquisition parameters
    acquisition_set_params[:acquisitions].each do |acquisition|

      @acquisition = Acquisition.new
      @acquisition.zone_id = acquisition_set_params[:zone_id]
      @acquisition.acquisition_set_id = @acquisition_set.id

      # Tries to save @acquisition. If fails, render error and return
      unless @acquisition_set.save
        render json: @acquisition.errors, status: :unprocessable_entity
        return
      end

      # For each access point inside acquisition, create it
      acquisition[:access_points].each do |access_point|
        @access_point = AccessPoint.new(access_point)
        @access_point.zone_id = acquisition_set_params[:zone_id]
        @access_point.acquisition= @acquisition

        # Tries to save @acquisition. If fails, render error and return
        unless @access_point.save
          render json: @access_point.errors, status: :unprocessable_entity
          return
        end

      end

    end

    render json: @acquisition_set, status: :created

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_acquisition_set
    @acquisition_set = AcquisitionSet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def acquisition_set_params
    params.require(:acquisition_set).permit(:normalization_algorithm, :time_interval, :measures_per_point, :zone_id,
                                            {acquisitions: [{access_points: [:BSSID, :RSSI]}]})
  end
end
