class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :update, :destroy]

  # GET /zones
  # GET /zones.json
  def index
    @zones = Zone.all
  end

  # GET /zones/1
  # GET /zones/1.json
  def show
  end

  # POST /zones
  # POST /zones.json
  def create
    @zone = Zone.new(zone_params)

    if @zone.save
      render :show, status: :created, location: @zone
    else
      render json: @zone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zones/1
  # PATCH/PUT /zones/1.json
  def update
    if @zone.update(zone_params)
      render :show, status: :ok, location: @zone
    else
      render json: @zone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zones/1
  # DELETE /zones/1.json
  def destroy
    @zone.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit(:name)
    end
end
