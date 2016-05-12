class MeasuresController < ApplicationController
  before_action :set_measure, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:create]


  # GET /measures
  def show_point_measures
    point=Point.find_by_id(measure_params[:point_id])
    measures=point.measures
    render json: measures
  end


  # POST /measures
  def create
    point_id=measure_params[:point_id]
    measure = Measure.new(measure_params)
    if Point.find_by_id(point_id)
      if measure.save
        render body: 'Measure was created.', status: :created
      else
        render body: 'Error: measure was not created', status: :unprocessable_entity
      end
    else
      render body: 'Point with id '+point_id.to_s+' does not exist'
    end
  end

  # PATCH/PUT /measures/1
  def update
    if @measure.update(measure_params)
      render json: @measure
    else
      render json: @measure.errors, status: :unprocessable_entity
    end
  end

  # DELETE /measures/1
  def destroy
    @measure.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def measure_params
      params.permit(:point_id)
    end
end
