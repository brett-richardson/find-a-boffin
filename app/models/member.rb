class Member < ActiveRecord::Base

  validates :name,    presence: true
  validates :website, presence: true, format: Url::FORMAT

  before_validation :shorten_url


  #=============================================================================
    protected
  #=============================================================================


  def update_short_url?
    short_url.nil? or short_url.empty? or website_changed?
  end


  def shorten_url
    write_attribute :short_url, UrlShortener.syncronous( website ) if update_short_url?
  end

end