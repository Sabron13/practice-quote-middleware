class TestApp
  def call(env)
    [200, {"Content-Type" => "text/plain"}, ["Placeholder"]]
  end
end
