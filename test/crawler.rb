module ShoobyDoBop
  class CrawlerTest < TestCase
    def setup
      @config = Config.instance
      @config['/entries'] = [
        {
          video: {
            url: 'https://www.youtube.com/watch?v=uFfsTeExwbQ',
          },
          goal: 20_000_000,
        },
        {
          video: {
            url: 'https://www.youtube.com/watch?v=q0Ib86qUodw',
          },
          goal: 10_000_000,
        },
      ]
    end

    def test_all
      Crawler.all do |crawler|
        assert_kind_of(Crawler, crawler)
      end
    end

    def test_uri
      Crawler.all do |crawler|
        assert_kind_of(VideoURI, crawler.uri)
      end
    end

    def test_goal
      Crawler.all do |crawler|
        assert_kind_of(Integer, crawler.goal)
      end
    end

    def test_count
      skip if Environment.ci?

      Crawler.all do |crawler|
        assert_kind_of(Integer, crawler.count)
      end
    end

    def test_remining
      skip if Environment.ci?

      Crawler.all do |crawler|
        assert_kind_of(Integer, crawler.remining)
      end
    end

    def test_exec
      skip if Environment.ci?
      Crawler.all(&:exec)
    end
  end
end
