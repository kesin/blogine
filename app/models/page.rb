class Page < ApplicationRecord

  has_many :comments, dependent: :destroy, as: :commentable
  IDENT_REGEX = /\A[a-zA-Z][a-zA-Z0-9_\-]*\z/
  validates :path, uniqueness: true, presence: true, length: {within: 0..255},
            format: {with: IDENT_REGEX,
                     message: "只允许字母、数字或者下划线(_)、中划线(-)、必须以字母开头"}
  default_scope { where(status: 0) }

  def to_param
    path
  end

  def public?
    status == 0
  end

end
