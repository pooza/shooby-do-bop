module ShoobyDoBop
  class CrawlerTest < Test::Unit::TestCase
    def setup
      @crawler = Crawler.new
    end

    def test_video_uri
      uri = @crawler.video_uri
      assert_true(uri.is_a?(VideoURI))
      assert_true(uri.absolute?)
    end

    def test_body
      assert_true(@crawler.body.present?)
    end
  end
end
