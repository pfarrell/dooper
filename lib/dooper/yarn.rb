require 'httparty'
require 'byebug'

class Yarn
  include HTTParty

  def initialize(uri)
    self.class.base_uri "#{uri}/ws/v1"
  end

  def build_path(resource, opts)
    params = opts.map {|k,v| "#{k}=#{v}"}.join("&")
    return "/#{resource}?#{params}"
  end

  def resp(resource, key, opts)
    path = build_path(resource, opts)
    resp = self.class.get(path)
    return resp[key] if resp.has_key? key
  end

  def cluster_info(opts={})
    return resp("cluster", "clusterInfo", opts)
  end

  def cluster_metrics(opts={})
    return resp("cluster/metrics", "clusterMetrics", opts)
  end

  def applications(opts={})
    rsp = resp("cluster/apps", "apps", opts)
    return rsp["app"] if rsp.has_key? "app"
  end

  def application(application_id, opts={})
    return resp("cluster/apps/#{application_id}", "app", opts)
  end
end
