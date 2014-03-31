require 'webhdfs'
require 'ostruct'

class HDFS
  attr_accessor :host, :port

  def client
    return WebHDFS::Client.new(@host, @port)
  end

  def exists?(path)
    return !list(path).nil?
  end

  def list(path)
    begin
      return client.list(path)
    rescue WebHDFS::FileNotFoundError
    end
  end

  def each(path)
    client.list(path).each{|file| yield OpenStruct.new(file)}
  end

  def each_file(path)
    each(path) {|file| yield file if file.type == "FILE"}
  end

  def each_dir(path)
    each(path) {|file| yield file if file.type == "DIRECTORY"}
  end
end

#hdfs = HDFS.new
#
#hdfs.host = "master01.fire.hdp.rgops.com"
#hdfs.port = 50070
#
#path = ARGV[0].nil? ? "/" : ARGV[0]
#
#hdfs.each_file(path) do |file| 
#  puts file.pathSuffix
#end
