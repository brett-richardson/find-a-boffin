class ConnectionFinder

  class << self #= Class methods ===
    def syncronous( member, term )
      self.new( member, term ).connections
    end

    def asyncronous
      raise FeatureNotImplemented.new 'Async ConnectionFinder not yet implemented.' # TODO: Queue a SideKiq worker or async job here
    end
  end #-----------------------------


  def initialize( member, term )
    @member = member
    @term   = term
  end


  def connections
    begin
      matches.inject( [] ) do |result, member|
        shortest = trails_to( member ).sort{ |t| t.length }
        result << Connection.new( shortest, @member, member )
      end
    rescue Exception => e
      raise ServiceFailed.new "ConnectionFinder service failed with message: #{e.message}"
    end
  end


  #===========================================================================
    protected
  #===========================================================================


  def matches # Represents all non-friends who match the term
    non_friends.where( 'content @@ :term', term: @term )
  end


  def non_friends # AR::Relation representing all non-friends of the member
    Member.where.not id: @member.filtered_friend_ids
  end


  def trails_to( member, trail = [], depth = 0 )
    return if depth > 6
    trail = trail.clone
    trail << member.id

    common_ids = common_ids_with member

    if common_ids.any?
      common_ids.map{ |id| trail.clone << id }
    else
      member.filtered_friends.inject( [] ) do |result, m|
        friend_trails = trails_to( m, trail, depth + 1 )
        result + friend_trails  unless friend_trails.nil?
        result
      end
    end
  end


  def common_ids_with( member )
    member.filtered_friend_ids.& @member.filtered_friend_ids
  end

end
