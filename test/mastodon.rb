module ShoobyDoBop
  class MastodonTest < Test::Unit::TestCase
    def setup
      @mastodon = Mastodon.new
    end

    def test_create_uri
      assert_true(@mastodon.create_uri.is_a?(Addressable::URI))
      assert_true(@mastodon.create_uri.absolute?)
      assert_equal(@mastodon.create_uri.path, '/api/v1/statuses')
    end

    def test_toot
      response = @mastodon.toot(Time.now.to_s, {visibility: 'direct'})
      assert_equal(response.code, 200)
    end
  end
end
