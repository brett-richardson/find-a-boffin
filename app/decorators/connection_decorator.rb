class ConnectionDecorator < Draper::Decorator

  delegate_all


  def linked_name
    h.link_to model.match.name, h.member_path( model.match )
  end


  def depth
    h.pluralize( model.trail.length, 'connections' ) + ' away'
  end


  def connection_list
    member_list.reverse.map do |m|
      m.linked_name
    end.push( model.member.name ).join '&nbsp;&raquo;&nbsp;'
  end


  #=============================================================================
    protected
  #=============================================================================


  def member_list
    Draper::CollectionDecorator.new Member.find model.trail
  end

end
