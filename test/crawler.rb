module ShoobyDoBop
  class CrawlerTest < Test::Unit::TestCase
    def test_all
      Crawler.all do |crawler|
        assert(crawler.is_a?(Crawler))
      end
    end

    def test_video_uri
      Crawler.all do |crawler|
        assert(crawler.video_uri.is_a?(VideoURI))
      end
    end

    def test_hook_uri
      Crawler.all do |crawler|
        assert(crawler.hook_uri.is_a?(Ginseng::URI))
      end
    end

    def test_goal
      Crawler.all do |crawler|
        assert(crawler.goal.is_a?(Integer))
      end
    end

    def test_count
      Crawler.all do |crawler|
        assert(crawler.count.is_a?(Integer))
      end
    end

    def test_remining
      Crawler.all do |crawler|
        assert(crawler.remining.is_a?(Integer))
      end
    end

    def test_rtags
      Crawler.all do |crawler|
        assert(crawler.tags.is_a?(Array))
      end
    end
  end
end
