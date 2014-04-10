require 'spec_helper'

describe WebHCat do
  let(:hcat) { WebHCat.new(url: "testapi", user: user) }
  let(:user) {"testuser"}

  context "#status" do
    let(:status) {{"status"=>"ok", "version"=>"v1"}}
    it "can retrieve hive status" do
      setup!("http://testapi/templeton/v1/status?user.name=#{user}", status)
      expect(hcat.status).to eq(status)
    end
  end
end
