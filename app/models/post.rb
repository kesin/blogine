class Post < ApplicationRecord

  belongs_to :column, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :tags, through: :post_tag_refs
  has_many :post_tag_refs, dependent: :destroy
  IDENT_REGEX = /\A[a-zA-Z][a-zA-Z0-9_\-]*\z/
  validates :ident, uniqueness: true, presence: true, length: {within: 0..255},
            format: {with: IDENT_REGEX,
                     message: "只允许字母、数字或者下划线(_)、中划线(-)、必须以字母开头"}
  default_scope { where(type: nil) }

  def to_param
    ident
  end

end
