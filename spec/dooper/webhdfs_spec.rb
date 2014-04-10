require 'spec_helper'

describe WebHDFS do
#def home_directory
#def list(path)
#def dirs(path)
#def files(path)
#def dir(path)
#def url(operation, path=nil)
# 
  let(:hdfs) { WebHDFS.new(url:"testapi") }
  let(:dir) {{"FileStatuses"=>{"FileStatus"=>[{"accessTime"=>0, "blockSize"=>0, "childrenNum"=>9, "fileId"=>16401, "group"=>"hdfs", "length"=>0, "modificationTime"=>1396981266728, "owner"=>"ambari-qa", "pathSuffix"=>"ambari-qa", "permission"=>"770", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>30, "fileId"=>1987674, "group"=>"ayang", "length"=>0, "modificationTime"=>1396631635110, "owner"=>"ayang", "pathSuffix"=>"ayang", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>1, "fileId"=>19422, "group"=>"dhallman", "length"=>0, "modificationTime"=>1386998798528, "owner"=>"dhallman", "pathSuffix"=>"dhallman", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>208775, "group"=>"esowa", "length"=>0, "modificationTime"=>1387049857584, "owner"=>"esowa", "pathSuffix"=>"esowa", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>2, "fileId"=>19478, "group"=>"ewang", "length"=>0, "modificationTime"=>1386999000512, "owner"=>"ewang", "pathSuffix"=>"ewang", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>7, "fileId"=>19651, "group"=>"gfoster", "length"=>0, "modificationTime"=>1386999038941, "owner"=>"gfoster", "pathSuffix"=>"gfoster", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>16404, "group"=>"hdfs", "length"=>0, "modificationTime"=>1386902955400, "owner"=>"hcat", "pathSuffix"=>"hcat", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>3, "fileId"=>16735, "group"=>"hdfs", "length"=>0, "modificationTime"=>1395345038871, "owner"=>"hdfs", "pathSuffix"=>"hdfs", "permission"=>"700", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>16402, "group"=>"hdfs", "length"=>0, "modificationTime"=>1386902922058, "owner"=>"hive", "pathSuffix"=>"hive", "permission"=>"700", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>5, "fileId"=>210646, "group"=>"hue", "length"=>0, "modificationTime"=>1397156637616, "owner"=>"hue", "pathSuffix"=>"hue", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>208814, "group"=>"krisden", "length"=>0, "modificationTime"=>1387049959005, "owner"=>"krisden", "pathSuffix"=>"krisden", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>208837, "group"=>"mcoyle", "length"=>0, "modificationTime"=>1387050002157, "owner"=>"mcoyle", "pathSuffix"=>"mcoyle", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>3, "fileId"=>16403, "group"=>"hadoop", "length"=>0, "modificationTime"=>1392327130323, "owner"=>"oozie", "pathSuffix"=>"oozie", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>8, "fileId"=>19843, "group"=>"pfarrelll", "length"=>0, "modificationTime"=>1394642458598, "owner"=>"pfarrell", "pathSuffix"=>"pfarrell", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>3, "fileId"=>19886, "group"=>"rmerriman", "length"=>0, "modificationTime"=>1386999177255, "owner"=>"rmerriman", "pathSuffix"=>"rmerriman", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>208993, "group"=>"rwhitaker", "length"=>0, "modificationTime"=>1387050355424, "owner"=>"rwhitaker", "pathSuffix"=>"rwhitaker", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>209002, "group"=>"scatanzarite", "length"=>0, "modificationTime"=>1387050392504, "owner"=>"scatanzarite", "pathSuffix"=>"scatanzarite", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>2, "fileId"=>19938, "group"=>"sconklin", "length"=>0, "modificationTime"=>1386999247717, "owner"=>"sconklin", "pathSuffix"=>"sconklin", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>2284960, "group"=>"sriram", "length"=>0, "modificationTime"=>1391116895084, "owner"=>"sriram", "pathSuffix"=>"sriram", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>5, "fileId"=>2133292, "group"=>"tableau", "length"=>0, "modificationTime"=>1395343577100, "owner"=>"tableau", "pathSuffix"=>"tableau", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>8, "fileId"=>19393, "group"=>"taskmaster", "length"=>0, "modificationTime"=>1388790994387, "owner"=>"taskmaster", "pathSuffix"=>"taskmaster", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>0, "fileId"=>696915, "group"=>"vbassine", "length"=>0, "modificationTime"=>1389292396952, "owner"=>"vbassine", "pathSuffix"=>"vbassine", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}, {"accessTime"=>0, "blockSize"=>0, "childrenNum"=>1, "fileId"=>222112, "group"=>"hadoop", "length"=>0, "modificationTime"=>1387407021647, "owner"=>"yarn", "pathSuffix"=>"yarn", "permission"=>"755", "replication"=>0, "type"=>"DIRECTORY"}]}}}

  context "#home_directory" do
    it "can retrieve home directory" do
      home_dir = {"Path"=>"/user/dr.who"}
      setup!("http://testapi/webhdfs/v1?op=GETHOMEDIRECTORY", home_dir)
      expect(hdfs.home_directory).to eq(home_dir["Path"])
    end

    it "can retrieve home directory" do
      home_dir = {"Path"=>"/user/pfarrell"}
      setup!("http://testapi/webhdfs/v1?user.name=pfarrell&op=GETHOMEDIRECTORY", home_dir)
      expect(WebHDFS.new(url: "testapi", user: "pfarrell").home_directory).to eq(home_dir["Path"])
    end
  end

  context "#list" do
    it "can retrieve files and directories on a path" do
      setup!("http://testapi/webhdfs/v1/user/pfarrell?op=LISTSTATUS", dir)
      expect(hdfs.list("/user/pfarrell")).to eq(dir["FileStatuses"]["FileStatus"])
    end
  end

  context "#dirs" do
  end

  context "#files" do
  end
  
end
