require 'httparty'

class WebHDFS
  include HTTParty

  def initialize(opts={})
    uri = opts[:url] || ENV["WEBHDFS_URL"] || "localhost:50070"
    self.class.base_uri uri
  end

  
end
