class TestApp
  def call(env)
    [200, {"Content-Type" => "text/plain"}, ["Testing"]]
  end
end