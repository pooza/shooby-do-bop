module ShoobyDoBop
  class StandaloneTest < Test::Unit::TestCase
    def setup
      @app = Standalone.new
    end

    def test_movie_url
      url = @app.movie_url
      assert_true(url.is_a?(Addressable::URI))
      assert_true(url.absolute?)
    end
  end
end
