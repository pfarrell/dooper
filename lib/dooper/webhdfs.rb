require 'httparty'

class WebHDFS
  include HTTParty
  attr_accessor :user

  def initialize(opts={})
    uri = opts[:url] || ENV["WEBHDFS_URL"] || "localhost:50070"
    @base_url = "/webhdfs/v1"
    @user = opts[:user]
    self.class.base_uri uri
  end

  def home_directory
    response(url("GETHOMEDIRECTORY"), "Path")
  end
  
  def list(path)
    response(url("LISTSTATUS", path), "FileStatuses")["FileStatus"]
  end

  def dirs(path)
    list(path).select{|obj| obj["type"] == "DIRECTORY"}
  end

  def files(path)
    list(path).select{|obj| obj["type"] == "FILE"}
  end
   
  def dir(path)
    response(url("GETCONTENTSUMMARY", path), "ContentSummary")
  end

  def url(operation, path=nil)
    base = "#{@base_url}#{path unless path.nil?}?op=#{operation}"
    base << "&user.name=#{user}" unless @user.nil?
    base
  end

  def response(url, key)
    self.class.get(url).parsed_response[key]
  end
end
