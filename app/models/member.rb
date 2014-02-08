class Member < ActiveRecord::Base

  validates :name,    presence: true
  validates :website, presence: true, format: Url::FORMAT

  before_save :set_short_url, if: :set_short_url?
  before_save :set_content,   if: :set_content?

  serialize :content


  def friends_count
    0
  end


  #=============================================================================
    protected
  #=============================================================================


  #= Conditionals ===

  def set_short_url?
    valid? and ( short_url.nil? or short_url.empty? or website_changed? )
  end


  def set_content?
    valid? and ( content.nil? or website_changed? )
  end


  #= Callbacks ===

  def set_short_url
    write_attribute :short_url, (
      begin
        UrlShortener.syncronous website
      rescue ServiceFailed => e
        website
      end
    )
  end


  def set_content
    write_attribute :content, (
      begin
        ContentFinder.syncronous website
      rescue ServiceFailed => e ; end
    )
  end

end
