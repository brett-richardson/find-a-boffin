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
      matches.inject( [] ) do |result, m|
        nearest_trail_to( m ).each do |trail|
          result << Connection.new( trail, @member, m )
        end
        result
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


  def nearest_trail_to( member, trail = [], depth = 0 )
    return if depth > 4
    trail = trail.clone
    trail << member.id

    common_ids = common_ids_with member

    if common_ids.any?
      common_ids.map{ |id| trail.clone << id }
    else
      member.filtered_friends.inject( [] ) do |result, m|
        next if (
          @member.filtered_friend_ids.include? m.id or trail.include? m.id
        )
        result + nearest_trail_to( m, trail, depth + 1 )
        result
      end
    end
  end


  def common_ids_with( member )
    member.filtered_friend_ids.& @member.filtered_friend_ids
  end

end
