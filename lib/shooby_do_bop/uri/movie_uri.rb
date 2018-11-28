require 'addressable/uri'
require 'httparty'

module ShoobyDoBop
  class MovieURI < Addressable::URI
    def initialize(options = {})
      super(options)
      @config = Config.instance
    end
  end
end
