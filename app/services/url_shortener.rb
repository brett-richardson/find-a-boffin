class UrlShortener

  class << self
    def syncronous( url ) # FIXME: Making calls to 3rd party services during a request is naughty.
      shorten url
    end

    def asyncronous
      raise FeatureNotImplemented.new 'Async URL shortener not yet implemented.' # TODO: Queue a SideKiq worker or async job here
    end


    #=============================================================================
      protected
    #=============================================================================


    def shorten( url )
      begin
        Googl.shorten( url ).short_url
      rescue Exception => e
        raise ServiceFailed.new "UrlShortener service failed with message: #{e.message}"
      end
    end
  end

end
