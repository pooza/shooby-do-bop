module ShoobyDoBop
  class CrawlerTest < Test::Unit::TestCase
    def setup
      @config = Config.instance
      return unless Environment.ci?
      @config['/entries'] = [
        {
          video: {
            url: 'https://www.youtube.com/watch?v=uFfsTeExwbQ',
          },
          hook: 'https://st.mstdn.b-shock.org/mulukhiya/webhook/00000',
          goal: 20_000_000,
        },
        {
          video: {
            url: 'https://www.youtube.com/watch?v=q0Ib86qUodw',
          },
          hook: 'https://st.mstdn.b-shock.org/mulukhiya/webhook/11111',
          goal: 10_000_000,
        },
      ]
    end

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
      return if Environment.ci?
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
      return if Environment.ci?
      Crawler.all do |crawler|
        assert(crawler.count.is_a?(Integer))
      end
    end

    def test_remining
      return if Environment.ci?
      Crawler.all do |crawler|
        assert(crawler.remining.is_a?(Integer))
      end
    end

    def test_rtags
      return if Environment.ci?
      Crawler.all do |crawler|
        assert(crawler.tags.is_a?(Array))
      end
    end
  end
end
