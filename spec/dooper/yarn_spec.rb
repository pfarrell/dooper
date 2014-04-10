require 'spec_helper'

describe Yarn do

  let (:yarn) { Yarn.new(url: "testapi") }

  context "#cluster_info" do
    let(:api_resp) { {"clusterInfo" => {"id"=>139, "startedOn"=>1396980920850, "state"=>"STARTED", "resourceManagerVersion"=>"2.2.0.2.0.6.0-76", "resourceManagerBuildVersion"=>"2.2.0.2.0.6.0-76 from 8656b1cfad13b03b29e98cad042626205e7a1c86 by jenkins source checksum 82bd166aa0ada92b44f8a154836b92", "resourceManagerVersionBuiltOn"=>"2013-10-18T00:26Z", "hadoopVersion"=>"2.2.0.2.0.6.0-76", "hadoopBuildVersion"=>"2.2.0.2.0.6.0-76 from 8656b1cfad13b03b29e98cad042626205e7a1c86 by jenkins source checksum d23ee1d271c6ac5bd27de664146be2", "hadoopVersionBuiltOn"=>"2013-10-18T00:19Z"}}}
    it "can retreive cluster status" do
      setup!("http://testapi/ws/v1/cluster", api_resp) 
      expect(yarn.cluster_info).to eq(api_resp["clusterInfo"])
    end
  end

  context "#cluster_metrics" do
    let(:cluster_metrics) {{"clusterMetrics"=>{"appsSubmitted"=>3819,"appsCompleted"=>3819,"appsPending"=>0,"appsRunning"=>0,"appsFailed"=>0,"appsKilled"=>0,"reservedMB"=>0,"availableMB"=>573440,"allocatedMB"=>0,"containersAllocated"=>0,"containersReserved"=>0,"containersPending"=>0,"totalMB"=>573440,"totalNodes"=>5,"lostNodes"=>0,"unhealthyNodes"=>0,"decommissionedNodes"=>0,"rebootedNodes"=>0,"activeNodes"=>5}}}
    it "can retrieve cluster metrics" do
      setup!("http://testapi/ws/v1/cluster/metrics", cluster_metrics)
      expect(yarn.cluster_metrics).to eq(cluster_metrics["clusterMetrics"])
    end
  end
end
