module ShoobyDoBop
  class TemplateTest < Test::Unit::TestCase
    def setup
      @config = Config.instance
      @uri = VideoURI.parse(@config['/video/url'])
      @template = Template.new('toot')
      @template[:video_uri] = @uri
      @template[:tags] = @config['/hashtags']
    end

    def test_to_s
      assert(@template.to_s.present?)
      assert(@template.to_s.include?(@uri.to_s))
    end
  end
end
