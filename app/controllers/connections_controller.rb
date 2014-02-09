class ConnectionsController < ApplicationController

  def index
    @member      = Member.find params[:member_id]
    @connections = ConnectionFinder.new( @member, params[:q] ).connections.map do |c|
      ConnectionDecorator.new c
    end
  end

end
