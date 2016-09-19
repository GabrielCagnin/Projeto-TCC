class ClassifyZoneController < ApplicationController

  def get_zone
    facility_name=params[:facility_name]
    acquisition = params[:acquisition].to_json.to_s.gsub('"', '\"')

    @r_script_path = Pathname.new('../machinelearning_R/awsSingleTest.r')
    render json: system('Rscript '+@r_script_path.realpath.to_s+' '+acquisition+' '+facility_name)
  end
end
