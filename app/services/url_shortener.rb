class UrlShortener

  class << self #= Class methods ===

    def syncronous( url ) # FIXME: Making calls to 3rd party services during a request is naughty.
      shorten url
    end

    def asyncronous
      raise Exception.new 'Not implemented'
      # TODO: Queue a SideKiq worker or async job here
    end


    #===========================================================================
      protected
    #===========================================================================


    def shorten( url )
      Googl.shorten( url ).short_url
    end

  end

end