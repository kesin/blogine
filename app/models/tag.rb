class Tag < ApplicationRecord

  has_many :post_tag_refs
  has_many :posts, through: :post_tag_refs

  def to_param
    name
  end

  def saved?
    id && persisted?
  end
end
