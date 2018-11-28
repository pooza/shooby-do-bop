module ShoobyDoBop
  class StandaloneTest < Test::Unit::TestCase
    def setup
      @app = Standalone.new
    end

    def test_movie_uri
      url = @app.movie_uri
      assert_true(url.is_a?(MovieURI))
      assert_true(url.absolute?)
    end
  end
end
