class Member < ActiveRecord::Base

  #= Relationships ===
  has_many :friendships, dependent: :destroy,
    inverse_of: :member
  has_many :inverse_friendships, dependent: :destroy,
    inverse_of: :target, class_name: 'Friendship'

  has_many :friends,         through: :friendships
  has_many :inverse_friends, through: :inverse_friendships

  #= Validations ===
  validates :name,    presence: true
  validates :website, presence: true, format: Url::FORMAT

  #= Callbacks ===
  before_save :set_short_url, if: :set_short_url?
  before_save :set_content,   if: :set_content?

  #= Misc ===
  serialize :content


  #= Friendships ===

  def friends_count # FIXME: Not very performant. Needs counter caching.
    combined_friendships.count
  end


  def combined_friendships
    Friendship.where 'member_id = :id OR target_id = :id', { id: id }
  end


  def filtered_friends # Returns all members of friendships which aren't the user
    combined_friendships.map{ |f| f.member_id == id ? f.target : f.member }
  end


  def filtered_friend_ids
    combined_friendships.map{
      |f| [f.member_id, f.target_id]
    }.flatten.select{ |fid| fid != id }
  end


  def friend_ids_in_common( member )
    ( filtered_friend_ids & member.filtered_friend_ids ).uniq
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
