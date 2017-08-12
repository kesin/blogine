# == Schema Information
#
# Table name: pages
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  path           :string(255)      not null
#  content        :text(65535)
#  html_content   :text(65535)
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default(0)
#

class Page < ApplicationRecord

  has_many :comments, dependent: :destroy, as: :commentable
  IDENT_REGEX = /\A[a-zA-Z][a-zA-Z0-9_\-]*\z/
  validates :path, uniqueness: true, presence: true, length: {within: 0..255},
            format: {with: IDENT_REGEX,
                     message: "只允许字母、数字或者下划线(_)、中划线(-)、必须以字母开头"}
  scope :unconcealed, -> { where(status: 0) }

  def to_param
    path
  end

  def public?
    status == 0
  end

end
