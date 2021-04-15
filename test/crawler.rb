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
        assert(crawler.is_a?(Crawler))
      end
    end

    def test_uri
      Crawler.all do |crawler|
        assert(crawler.uri.is_a?(VideoURI))
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

    def test_exec
      return if Environment.ci?
      Crawler.all(&:exec)
    end
  end
end
