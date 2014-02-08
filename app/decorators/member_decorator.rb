class MemberDecorator < Draper::Decorator

  delegate_all


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

end
