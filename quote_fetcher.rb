class QuoteFetcher
  def initialize(app)
    @app = app
    @quotes = IO.readlines("fixtures/rickygervais.txt").map { |quote| quote.chomp }
  end

  def call(env)
    @app.call(env)
  end
end
