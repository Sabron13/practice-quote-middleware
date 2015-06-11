class QuoteFetcher
  def initialize(app)
    @app = app
    @quotes = IO.readlines("fixtures/rickygervais.txt").map { |quote| quote.chomp }
  end

  def call(env)
    req = Rack::Request.new(env)

    if req.path_info == "/quote"
      [200, {"Content-Type" => "text/plain"}, [@quotes.sample]]
    else
      @app.call(env)
    end
  end
end
