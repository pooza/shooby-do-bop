require 'active_support'
require 'active_support/core_ext'
require 'active_support/dependencies/autoload'
require 'ginseng'

module ShoobyDoBop
  extend ActiveSupport::Autoload

  autoload :Config
  autoload :Environment
  autoload :Logger
  autoload :Mastodon
  autoload :Package
  autoload :Slack
  autoload :Standalone
  autoload :YouTubeService

  autoload_under 'uri' do
    autoload :VideoURI
  end
end
