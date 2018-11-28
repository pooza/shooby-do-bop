module ShoobyDoBop
  class StandaloneTest < Test::Unit::TestCase
    def setup
      @app = Standalone.new
    end

    def test_video_uri
      uri = @app.video_uri
      assert_true(uri.is_a?(VideoURI))
      assert_true(uri.absolute?)
    end

    def test_body
      assert_true(@app.body.present?)
    end
  end
end
