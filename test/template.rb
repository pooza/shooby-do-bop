module ShoobyDoBop
  class TemplateTest < Test::Unit::TestCase
    def setup
      @crawler = Crawler.all.first
      @template = Template.new('toot')
      @template[:crawler] = @crawler
    end

    def test_to_s
      return unless Environment.ci?
      assert(@template.to_s.present?)
      assert(@template.to_s.include?(@uri.to_s))
    end
  end
end
