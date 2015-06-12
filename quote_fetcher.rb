class QuoteFetcher
  attr_reader :quotes

  def initialize(app)
    @app = app
    @quotes = IO.readlines("fixtures/rickygervais.txt").map { |quote| quote.chomp }
  end

  def call(env)
    req = Rack::Request.new(env)

    if req.path_info == "/quote"
      [200, {"Content-Type" => "text/plain"}, [quote]]
    else
      @app.call(env)
    end
  end

  def quote
    @quotes.sample
  end

end
