class Page < Post

  has_many :comments, dependent: :destroy, as: :commentable
  default_scope { where(type: 'Page') }

end
