require_relative "quote_fetcher"
require "rack/lobster"

use QuoteFetcher
run Rack::Lobster.new
