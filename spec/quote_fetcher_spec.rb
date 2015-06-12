require_relative "../quote_fetcher"
require 'rack'

class TestApp
  def call(env)
    @env = env
    [200, {"Content-Type" => "text/html"}, ["OK"]]
  end
end

describe QuoteFetcher do
  let (:app) { lambda {[200, {"Content-Type" => "text/plain"}, ['this is a dummy app']]} }
  
end