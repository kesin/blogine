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

  def current_controller?(*args)
    args.any? { |v| v.to_s.downcase == controller.controller_name }
  end

  def obligate_exists?(number)
    left_bar_menu = Settings.blogine.left_bar.menu
    return left_bar_menu.obligate_1_name.present? && left_bar_menu.obligate_1_link.present? if number == 1
    left_bar_menu.obligate_2_name.present? && left_bar_menu.obligate_2_link.present? if number == 2
  end

  def gravatar_image(email)
    hash = Digest::MD5.hexdigest(email)
    "//www.gravatar.com/avatar/#{hash}?s=40&d=mm"
  end
end
