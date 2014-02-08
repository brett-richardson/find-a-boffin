require 'open-uri'


class ContentFinder # Finds heading content given a URL

  DEFAULT_SELECTORS = [ 'h1', 'h2', 'h3' ] # Specify the selectors that are extracted

  @@test_mode = false # Allow test mode to speed up specs
  cattr_accessor :test_mode


  class << self #- Class methods -----------------------------------------------

    def syncronous( url, selectors = DEFAULT_SELECTORS )
      raise ArgumentError.new unless url =~ Url::FORMAT
      return {} if @@test_mode

      begin
        instance = self.new url

        selectors.inject( {} ) do |result, selector| # Loop through css selectors and populate a hash with their values, using the selector as the key
          result[ selector ] = instance.find_content selector
          result
        end
      rescue Exception => e
        raise ServiceFailed.new "ContentFinder service failed. Message: #{e.message}"
      end
    end


    def asyncronous
      raise FeatureNotImplemented.new 'Asyncronous ContentFinder not implemented'
    end

  end # ------------------------------------------------------------------------


  def initialize( url )
    @document ||= Nokogiri::HTML open url
  end


  def find_content( selector )
    @document.css( selector ).first.content
  end

end
