require 'spec_helper'

describe Yarn do

  context "#cluster_info" do
    let(:cluster_info) { {"clusterInfo" => {"id"=>139, "startedOn"=>1396980920850, "state"=>"STARTED", "resourceManagerVersion"=>"2.2.0.2.0.6.0-76", "resourceManagerBuildVersion"=>"2.2.0.2.0.6.0-76 from 8656b1cfad13b03b29e98cad042626205e7a1c86 by jenkins source checksum 82bd166aa0ada92b44f8a154836b92", "resourceManagerVersionBuiltOn"=>"2013-10-18T00:26Z", "hadoopVersion"=>"2.2.0.2.0.6.0-76", "hadoopBuildVersion"=>"2.2.0.2.0.6.0-76 from 8656b1cfad13b03b29e98cad042626205e7a1c86 by jenkins source checksum d23ee1d271c6ac5bd27de664146be2", "hadoopVersionBuiltOn"=>"2013-10-18T00:19Z"}}}
    it "can retreive cluster status" do
      stub_request(:get, "http://testapi/ws/v1/cluster").
        to_return(:status => 200, :body => cluster_info.to_json, :headers => {'Content-Type' => 'application/json'})
      expect(Yarn.new(url: "testapi").cluster_info).to eq(cluster_info["clusterInfo"])
    end
  end
end
