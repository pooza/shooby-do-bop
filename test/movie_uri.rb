module ShoobyDoBop
  class MovieURITest < Test::Unit::TestCase
    def setup
      @uri = Standalone.new.movie_uri
    end

    def test_say
      Slack.all do |slack|
        assert_true(slack.say({text: Package.full_name}).response.is_a?(Net::HTTPOK))
      end
    end
  end
end
