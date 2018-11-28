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
    end

    def test_count
      assert_true(@uri.count.is_a?(Integer))
    end
  end
end
