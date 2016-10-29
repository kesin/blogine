class Comment < ApplicationRecord
  belongs_to :commentable, counter_cache: true, polymorphic: true

  AUTHOR_COMMENT = 2
  VERIFIED = 1
  UNVERIFIED = 0
  scope :unconcealed, -> {where(status: [VERIFIED, AUTHOR_COMMENT])}

  def verified?
    status == 1
  end
end
