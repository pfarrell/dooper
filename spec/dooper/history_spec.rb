require 'spec_helper'

describe WebHCat do

  let(:hist) { History.new(url: "testapi") }

  context "#status" do
    let(:history_info) {{"historyInfo"=>{"startedOn"=>1396980916286, "hadoopVersion"=>"2.2.0.2.0.6.0-76", "hadoopBuildVersion"=>"2.2.0.2.0.6.0-76 from 8656b1cfad13b03b29e98cad042626205e7a1c86 by jenkins source checksum d23ee1d271c6ac5bd27de664146be2", "hadoopVersionBuiltOn"=>"2013-10-18T00:19Z"}}}

    it "can retrieve hive status" do
      setup!("http://testapi/ws/v1/history/info", history_info)
      expect(hist.history_info).to eq(history_info["historyInfo"])
    end
  end
end
