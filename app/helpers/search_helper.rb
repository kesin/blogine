module SearchHelper

  def highlight_result(hit, result, key)
    return result.title if hit.highlights(key).blank? && key == :title
    return result.intro if hit.highlights(key).blank? && key == :content
    result = ''
    hit.highlights(key).each_with_index do |h, index|
      result << h.format { |word| "<div class='keywords'>#{word}</div>" }
      result << '...' if index > 1
    end
    result
  end

end
