module ShoobyDoBop
  class VideoURITest < Test::Unit::TestCase
    def setup
      @uri = Standalone.new.video_uri
    end

    def test_id
      assert_true(@uri.id.present?)
    end

    def test_data
      assert_true(@uri.data.is_a?(Hash))
      assert_true(@uri.data.present?)
    end

    def test_title
      assert_true(@uri.title.is_a?(String))
      assert_true(@uri.title.present?)
    end

    def test_count
      assert_true(@uri.count.is_a?(Integer))
      assert_true(@uri.count.present?)
    end

    def test_goal
      assert_true(@uri.goal.is_a?(Integer))
      assert_true(@uri.goal.present?)
    end

    def test_remining
      assert_true(@uri.remining.is_a?(Integer))
    end
  end
end
