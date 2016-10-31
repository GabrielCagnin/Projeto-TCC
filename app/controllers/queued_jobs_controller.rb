class QueuedJobsController

  def execute_job
    @job = QueuedJob.new(job_params)
  end

  def job_params
    params.require(:queued_job).permit(:id, :op_type, :facility_id, {access_points: [:BSSID, :RSSI]}, :response)
  end

end