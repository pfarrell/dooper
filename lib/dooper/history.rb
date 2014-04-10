require 'httparty'
require 'byebug'

class History
  include HTTParty

  def initialize(opts={})
    byebug
    uri = opts[:url] || ENV["HISTORY_URL"]
    self.class.base_uri "#{uri}/ws/v1"
  end

  def build_path(resource, opts)
    params = opts.map {|k,v| "#{k}=#{v}"}.join("&")
    "/#{resource}?#{params}"
  end

  def resp(resource, key, opts)
    path = build_path(resource, opts)
    resp = self.class.get(path)
    resp[key] if resp.has_key? key
  end

  def history_info(opts={})
    resp "/history/info", "historyInfo", opts
  end

  def job_attempts(job_id, opts={})
    resp "history/mapreduce/jobs/job_#{job_id}/jobattempts", "jobattempt", opts
  end
end
