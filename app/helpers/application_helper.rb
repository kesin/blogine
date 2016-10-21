module ApplicationHelper
  def title(title)
    content_for(:title) { title }
  end

  def meta_keywords(keywords)
    content_for(:meta_keywords) { keywords }
  end

  def meta_description(description)
    content_for(:meta_description) { description }
  end
end
