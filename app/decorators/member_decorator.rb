class MemberDecorator < Draper::Decorator

  delegate_all
  decorates_association :friendship


  def linked_name
    h.link_to model.name, h.member_url( member )
  end


  def short_url
    h.link_to model.short_url, model.short_url
  end


  def website
    h.link_to model.website, model.website
  end


  def content_from( selector )
    if model.content.present? and model.content[selector].present?
      model.content[selector]
    else
      h.content_tag :em, "No content found for selector '#{selector}'"
    end
  end


  def friends_list
    friends = Draper::CollectionDecorator.new model.filtered_friends

    if friends.any?
      h.content_tag :ul do
        friends.map do |f|
          h.content_tag( :li ){ f.linked_name }
        end.join( '' ).html_safe
      end
    else
      h.content_tag :em, 'Sorry, no friends found.'
    end
  end

end
