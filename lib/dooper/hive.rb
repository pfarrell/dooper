require 'httparty'
require 'byebug'

class Hive
  include HTTParty
  attr_accessor :user
  base_uri "master02.fire.hdp.rgops.com:50111"

  def initialize
    @user = 'pfarrell'
  end

  def is_exception?(resp)
    puts resp.inspect
    return true
  end

  def status
    return self.class.get("/templeton/v1/status?user.name=#{@user}")
  end

  def databases
    return self.class.get("/templeton/v1/ddl/database?user.name=#{@user}")
  end

  def tables(database)
    return self.class.get("/templeton/v1/ddl/database/#{database}/table?user.name=#{@user}")
  end

  def partitions(database, table)
    return self.class.get("/templeton/v1/ddl/database/#{database}/table/#{table}/partition?user.name=#{@user}")
  end

  def partition(database, table, partition)
    return self.class.get("/templeton/v1/ddl/database/#{database}/table/#{table}/partition/#{partition}?user.name=#{user}")
  end

  def partition_exists?(database, table, partition)
    return self.class.get("/templeton/v1/ddl/database/#{database}/table/#{table}/partition/#{partition}?user.name=#{user}").has_key?("partitioned")
  end

  def partition_file_size(database, table, partition)
    resp = self.class.get("/templeton/v1/ddl/database/#{database}/table/#{table}/partition/#{partition}?user.name=#{user}")
    return resp.has_key?("partitioned") ? resp["totalFileSize"] : nil
  end

  def jobs
    return self.class.get("/templeton/v1/jobs?user.name=#{@user}&showall=true")
  end
end
