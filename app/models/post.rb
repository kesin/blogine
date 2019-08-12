# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  ident          :string(255)
#  content        :text(65535)
#  html_content   :text(65535)
#  column_id      :integer
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  intro          :text(65535)
#  comments_count :integer          default(0)
#

class Post < ApplicationRecord

  belongs_to :column, counter_cache: true
  has_many :comments, dependent: :destroy, as: :commentable
  has_many :post_tag_refs, dependent: :destroy
  has_many :tags, through: :post_tag_refs
  IDENT_REGEX = /\A[a-zA-Z][a-zA-Z0-9_\-]*\z/
  validates  :title, presence: {message: '文章名不能为空'}
  validates :ident, uniqueness: {message: '文章路径已被占用'}, presence: true, length: {within: 0..255},
            format: {with: IDENT_REGEX, message: '文章路径只允许字母、数字或者下划线(_)、中划线(-)、必须以字母开头'}
  scope :releases, -> { where(status: [0, 2]) }
  scope :unconcealed, -> { where(status: 0) }
  scope :sorted_by_created, -> { order("created_at DESC") }
  scope :sorted_by_updated, -> { order("updated_at DESC") }

  POST_TYPE = {
      0 => '所有人可见',
      2 => '仅自己可见',
      1 => '草稿'
  }

  if Settings.blogine.enable_search # enable search if settings enable_search is true
    searchable do
      text :title, stored: true
      text :content, stored: true
      string :ident
      integer :status
      time :created_at
    end
  end

  def to_param
    ident
  end

  def public?
    status == 0
  end

  def draft?
    status == 1
  end

  def private?
    status == 2
  end

end
