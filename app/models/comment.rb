class Comment < ApplicationRecord
  belongs_to :commentable, counter_cache: true, polymorphic: true
  has_many :children, foreign_key: 'parent_id', class_name: 'Comment'
  paginates_per 20

  AUTHOR_COMMENT = 2
  VERIFIED = 1
  UNVERIFIED = 0

  # get all top comments with .unconcealed, get comments group with .unconcealed.includes(:children)
  scope :unconcealed, -> {where(status: [VERIFIED, AUTHOR_COMMENT], parent_id: 0)}

  def verified?
    status == 1
  end

  def saved?
    id && persisted?
  end
end
