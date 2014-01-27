class MembersController < InheritedResources::Base

  #=============================================================================
    protected
  #=============================================================================


  def permitted_params
    params.permit member: [ :name, :website ]
  end

end