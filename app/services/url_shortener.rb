class UrlShortener

  class << self #= Class methods ===

    def syncronous( url ) # FIXME: Making calls to 3rd party services during a request is naughty.
      shorten url
    end

    def asyncronous
      raise FeatureNotImplemented.new 'Async URL shortener not yet implemented.'
      # TODO: Queue a SideKiq worker or async job here
    end


    #===========================================================================
      protected
    #===========================================================================


    def shorten( url )
      begin
        Googl.shorten( url ).short_url
      rescue Exception => e
        Rails.logger.error "Goo.gl URL shortener failed. Exception class: #{e.class}, Exception message: #{e.message}"
        return url
      end
    end

  end

end