module DecorationHelper

  def decorator
    @decorator ||= resource.decorate
  end

end