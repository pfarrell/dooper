require 'httparty'

class Yarn
  include HTTParty

  def initialize(opts={})
    uri = opts[:url] || ENV["YARN_URL"] || "localhost:8088"
    self.class.base_uri "#{uri}/ws/v1"
  end

  def build_path(resource, opts)
    params = opts.map {|k,v| "#{k}=#{v}"}.join("&")
    return "/#{resource}?#{params}"
  end

  def resp(resource, key, opts)
    path = build_path(resource, opts)
    self.class.get(path)[key]
  end

  def cluster_info(opts={})
    resp("cluster", "clusterInfo", opts)
  end

  def cluster_metrics(opts={})
    resp("cluster/metrics", "clusterMetrics", opts)
  end

  def cluster_scheduler(opt={})
    resp("cluster/scheduler", "clusterScheduler", opts)
  end

  def cluster_applications(opts={})
    apps = resp("cluster/apps", "apps", opts)
    apps.nil? ? [] : apps["app"]
  end

  def cluster_application(application_id, opts={})
    resp("cluster/apps/#{application_id}", "app", opts)
  end

  def cluster_nodes(opts={})
    resp("cluster/nodes", "nodes", opts)["node"]
  end
end
