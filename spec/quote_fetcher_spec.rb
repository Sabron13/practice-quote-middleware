require_relative "../quote_fetcher"
require 'rack'

class TestApp
  def call(env)
    @env = env
    [200, {"Content-Type" => "text/html"}, ["OK"]]
  end
end

describe QuoteFetcher do
  let(:testapp) { TestApp.new }
  let(:app) { proc {[200, {'Content-Type' => 'text/plain'}, ['OK']]} }
  subject { QuoteFetcher.new(app) }

  context "when called with a get request" do
    let(:request) { Rack::MockRequest.new(app) }
    let(:response) { request.get('/quote')}

    it "responds with a quote" do
      
    end
  end
end
