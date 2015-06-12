require_relative "../quote_fetcher"
require 'rack/test'

class TestApp
  def call(env)
    @env = env
    [200, {"Content-Type" => "text/html"}, ["OK"]]
  end
end

describe QuoteFetcher do
  let(:testapp) { TestApp.new }
  let(:middleware) { QuoteFetcher.new(testapp) }
  let(:quotes) { middleware.quotes }

  context "when called with a GET request to the correct route" do
    let(:request) { Rack::MockRequest.new(testapp) }
    let(:response) { request.get('/quote') }

    it "responds with a quote" do
      puts quotes
      puts response.body
      expect(quotes.include? response.body).to eq(true)
    end
  end

  context "when called with a get request to the wrong route" do
    let(:request) { Rack::MockRequest.new(testapp) }
    let(:response) { request.get('/wrongroute') }

    it "doesn't return a quote" do
      expect(quotes.include? response.body).to eq(false)
    end
  end


end
