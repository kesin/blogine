module CommentsHelper

  def author_class(status)
    status == 2 ? 'by-author' : ''
  end

  def comment_avatar(status, email)
    if status == 2
      Settings.blogine.avatar
    else
      gravatar_image(email)
    end
  end
end
