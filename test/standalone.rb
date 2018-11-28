module ShoobyDoBop
  class StandaloneTest < Test::Unit::TestCase
    def setup
      @app = Standalone.new
    end

    def test_video_uri
      url = @app.video_uri
      assert_true(url.is_a?(VideoURI))
      assert_true(url.absolute?)
    end
  end
end
