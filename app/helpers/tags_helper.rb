module TagsHelper
  def highlight_class(tag)
    tag.nil? ? '' : 'filter-highlight'
  end
end
