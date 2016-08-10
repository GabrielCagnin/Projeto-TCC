class AcquisitionSetsController < ApplicationController
  before_action :set_acquisition_set, only: [:show, :update, :destroy]

  # GET /acquisition_sets
  # GET /acquisition_sets.json
  def index
    @acquisition_sets = AcquisitionSet.all
  end

  # GET /acquisition_sets/1
  # GET /acquisition_sets/1.json
  def show
  end

  # POST /acquisition_sets
  # POST /acquisition_sets.json
  def create
    @acquisition_set = AcquisitionSet.new(acquisition_set_params)

    if @acquisition_set.save
      render :show, status: :created, location: @acquisition_set
    else
      render json: @acquisition_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /acquisition_sets/1
  # PATCH/PUT /acquisition_sets/1.json
  def update
    if @acquisition_set.update(acquisition_set_params)
      render :show, status: :ok, location: @acquisition_set
    else
      render json: @acquisition_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /acquisition_sets/1
  # DELETE /acquisition_sets/1.json
  def destroy
    @acquisition_set.destroy
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
