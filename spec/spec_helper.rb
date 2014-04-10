require 'dooper'
require 'byebug'
require 'webmock/rspec'

module SetupHelper
  def setup!(endpoint, fixture)
    stub_request(:get, endpoint).
      to_return(:status => 200, :body => fixture.to_json, :headers => {'Content-Type' => 'application/json'})
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.include WebMock::API
  config.include SetupHelper
end
