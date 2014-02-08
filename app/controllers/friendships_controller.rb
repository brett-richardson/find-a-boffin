class FriendshipsController < InheritedResources::Base

  belongs_to :member
  respond_to :json, only: :index


  def new
    @member = Member.find params[:member_id]
    super
  end


  def create
    super{ member_url @member }
  end


  #=============================================================================
    protected
  #=============================================================================


  def permitted_params
    params.permit friendship: [ :member_id, :target_id ]
  end

end
