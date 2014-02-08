class MembersController < InheritedResources::Base

  helper DecorationHelper


  #=============================================================================
    protected
  #=============================================================================


  def permitted_params
    params.permit member: [ :name, :website ]
  end

end