class Post < ApplicationRecord

  validates :ident, uniqueness: true, presence: true, length: {within: 0..255},
            format: {with: /\A[a-zA-Z][a-zA-Z0-9_\-]*\z/,
                     message: "只允许字母、数字或者下划线(_)、中划线(-)、必须以字母开头"}

  def to_param
    ident
  end

end
