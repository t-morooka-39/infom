# frozen_string_literal: true

module ApplicationHelper
  def page_title
    title = 'infomus'
    title = @page_title + '-' + title if @page_title
    title
  end

  def menu_link_to(text, path, _options = {})
    link_to_unless_current(text, path, options = {}) do
      content_tag(:span, text)
    end
  end
end
