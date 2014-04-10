require 'httparty'

class WebHCat
  include HTTParty
  attr_accessor :user

  def initialize(opts={})
    uri  = opts[:url] || ENV["WEBHCAT_URL"] || "localhost:50111"
    @user = opts[:user] || ENV["WEBHCAT_USER"]
    self.class.base_uri uri
  end

  def response(url)
    self.class.get(url).parsed_response
  end

  def is_exception?(resp)
    puts resp.inspect
    true
  end

  def status
    self.class.get("/templeton/v1/status?user.name=#{@user}").parsed_response
  end

  def databases
    response("/templeton/v1/ddl/database?user.name=#{@user}")
  end

  def tables(database)
    response("/templeton/v1/ddl/database/#{database}/table?user.name=#{@user}")
  end

  def partitions(database, table)
    response("/templeton/v1/ddl/database/#{database}/table/#{table}/partition?user.name=#{@user}")
  end

  def partition(database, table, partition)
    response("/templeton/v1/ddl/database/#{database}/table/#{table}/partition/#{partition}?user.name=#{user}")
  end

  def partition_exists?(database, table, partition)
    response("/templeton/v1/ddl/database/#{database}/table/#{table}/partition/#{partition}?user.name=#{user}").has_key?("partitioned")
  end

  def partition_file_size(database, table, partition)
    resp = response("/templeton/v1/ddl/database/#{database}/table/#{table}/partition/#{partition}?user.name=#{user}")
    resp.has_key?("partitioned") ? resp["totalFileSize"] : nil
  end

end
