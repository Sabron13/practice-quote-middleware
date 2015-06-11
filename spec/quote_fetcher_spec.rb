require "../quote_fetcher.rb"

describe QuoteFetcher do
  let (:app) { lambda {[200, {"Content-Type" => "text/plain"}, ['this is a dummy app']]} }
  
end