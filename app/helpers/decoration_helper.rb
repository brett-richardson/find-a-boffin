module DecorationHelper

  def decorator
    @decorator ||= resource.decorate
  end


  def collection_decorator
    @collection_decorator ||= Draper::CollectionDecorator.new collection
  end

end
