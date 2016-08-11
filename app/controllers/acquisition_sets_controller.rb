class AcquisitionSetsController < ApplicationController
  before_action :set_acquisition_set, only: [:show]

  def show
    render json: @acquisition_set
  end


  # It must create new entries for all the sub-nested resources (points and its access points)
  def create_set

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_acquisition_set
    @acquisition_set = AcquisitionSet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def acquisition_set_params
    params.require(:acquisition_set).permit(:normalization_algorithm, :time_interval, :measures_per_point)
  end
end
