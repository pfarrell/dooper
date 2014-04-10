require 'httparty'
require 'byebug'

class History
  include HTTParty

  def initialize(opts={})
    uri = opts[:url] || ENV["HISTORY_URL"] || "localhost:19888"
    self.class.base_uri "#{uri}/ws/v1"
  end

  def build_path(resource, opts)
    params = opts.map {|k,v| "#{k}=#{v}"}.join("&")
    "#{resource}?#{params}"
  end

  def resp(resource, key, opts)
    path = build_path(resource, opts)
    self.class.get(path)[key]
  end

  def history_info(opts={})
    resp "/history/info", "historyInfo", opts
  end

  def job_attempts(job_id, opts={})
    resp "history/mapreduce/jobs/job_#{job_id}/jobattempts", "jobattempt", opts
  end
end
