# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  posts_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ApplicationRecord

  has_many :post_tag_refs
  has_many :posts, through: :post_tag_refs

  validates :name, uniqueness: true, presence: true

  def to_param
    name
  end

  def saved?
    id && persisted?
  end
end
