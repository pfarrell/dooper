require 'aws-sdk-core'

class S3Objects
  attr_accessor :client, :bucket, :prefix, :start, :end

  def initialize
    @client = Aws::S3.new
  end

  def each
    @client.list_objects(bucket: @bucket, prefix: @prefix).each do |resp|
      resp.contents.each do |obj|
        yield obj
      end
    end
  end
end


