module CommentsHelper
  def author_class(status)
    status == 2 ? 'by-author' : ''
  end
end
