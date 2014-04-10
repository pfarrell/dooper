require 'spec_helper'

describe WebHCat do

  context "#status" do
    let(:status) {{"status"=>"ok", "version"=>"v1"}}
    let(:user) {"testuser"}
    it "can retrieve hive status" do
      stub_request(:get, "http://testapi/templeton/v1/status?user.name=#{user}").
        to_return(:status => 200, :body => status.to_json, :headers => {'Content-Type' => 'application/json'})
        expect(WebHCat.new(url: "testapi", user: user).status).to eq(status)
    end
  end
end
