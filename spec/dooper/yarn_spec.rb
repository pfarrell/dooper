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

  context "#cluster_application" do
    let(:application) {{"app"=>{"id"=>"application_1396980920850_0152", "user"=>"ayang", "name"=>"select params['player_params%5Bvideo%5D...10(Stage-1)", "queue"=>"default", "state"=>"FINISHED", "finalStatus"=>"SUCCEEDED", "progress"=>100.0, "trackingUI"=>"History", "trackingUrl"=>"http://master01.example.com:8088/proxy/application_1396980920850_0152/jobhistory/job/job_1396980920850_0152", "diagnostics"=>"", "clusterId"=>1396980920850, "applicationType"=>"MAPREDUCE", "startedTime"=>1396989015822, "finishedTime"=>1396989043999, "elapsedTime"=>28177, "amContainerLogs"=>"http://data03.example.com:8042/node/containerlogs/container_1396980920850_0152_01_000001/ayang", "amHostHttpAddress"=>"data03.example.com:8042"}}}
    let(:app_id) {"application_1396980920850_0152"}
    it "can retrieve single applications" do
      setup!("http://testapi/ws/v1/cluster/apps/#{app_id}", application)
      expect(yarn.cluster_application(app_id)).to eq(application["app"])
    end
  end

  context "#nodes" do
    let(:nodes) {{"nodes"=>{"node"=>[{"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"data03.example.com:45454", "nodeHostName"=>"data03.example.com", "nodeHTTPAddress"=>"data03.example.com:8042", "lastHealthUpdate"=>1397192437429, "healthReport"=>"", "numContainers"=>0, "usedMemoryMB"=>0, "availMemoryMB"=>114688}, {"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"data01.example.com:45454", "nodeHostName"=>"data01.example.com", "nodeHTTPAddress"=>"data01.example.com:8042", "lastHealthUpdate"=>1397192435475, "healthReport"=>"", "numContainers"=>0, "usedMemoryMB"=>0, "availMemoryMB"=>114688}, {"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"data05.example.com:45454", "nodeHostName"=>"data05.example.com", "nodeHTTPAddress"=>"data05.example.com:8042", "lastHealthUpdate"=>1397192431062, "healthReport"=>"", "numContainers"=>2, "usedMemoryMB"=>7168, "availMemoryMB"=>107520}, {"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"data04.example.com:45454", "nodeHostName"=>"data04.example.com", "nodeHTTPAddress"=>"data04.example.com:8042", "lastHealthUpdate"=>1397192433927, "healthReport"=>"", "numContainers"=>1, "usedMemoryMB"=>3584, "availMemoryMB"=>111104}, {"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"data02.example.com:45454", "nodeHostName"=>"data02.example.com", "nodeHTTPAddress"=>"data02.example.com:8042", "lastHealthUpdate"=>1397192488529, "healthReport"=>"", "numContainers"=>2, "usedMemoryMB"=>7168, "availMemoryMB"=>107520}]}}}
    it "can get info about cluster nodes" do
      setup!("http://testapi/ws/v1/cluster/nodes", nodes)
      expect(yarn.cluster_nodes).to eq(nodes["nodes"]["node"])
    end
  end

  context "#node" do
    let(:node) {{"node"=>{"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"data02.example.com:45454", "nodeHostName"=>"data02.example.com", "nodeHTTPAddress"=>"data02.example.com:8042", "lastHealthUpdate"=>1397193568528, "healthReport"=>"", "numContainers"=>11, "usedMemoryMB"=>75264, "availMemoryMB"=>39424}}}
    let(:node_id) {"data02.example.com:45454"}
    it "can get info about a node" do
      setup!("http://testapi/ws/v1/cluster/nodes/#{node_id}", node)
      expect(yarn.cluster_node(node_id)).to eq(node["node"])
    end
  end
end
