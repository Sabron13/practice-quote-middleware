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
  let(:middleware) { QuoteFetcher.new(testapp) }
  let(:request) { Rack::MockRequest.new(middleware) }
  let(:quotes) { middleware.quotes }

  context "when called with a GET request to the correct route" do
    let(:response) { request.get('/quote') }

    it "responds with status 200" do
      expect(response.status).to eq(200)
    end

    it "responds with a quote" do
      expect(quotes.include? response.body).to eq(true)
    end
  end

  context "when called with a GET request to the wrong route" do
    let(:response) { request.get('/wrongroute') }

    it "doesn't return a quote" do
      expect(quotes.include? response.body).to eq(false)
    end

    it "doesn't crash" do
      expect(response.status).to eq(200)
    end
  end


end
