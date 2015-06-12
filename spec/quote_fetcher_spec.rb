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

  context "when called with a get request" do
    let(:request) { Rack::MockRequest.new(testapp) }
    let(:response) { request.get('/quote')}

    it "responds with a quote" do
      expect(middleware.quotes.include? response.body)
    end

  end
end
