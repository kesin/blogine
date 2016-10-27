class Comment < ApplicationRecord
  belongs_to :commentable, counter_cache: true, polymorphic: true

  scope :verified, -> {where(status: 1)}

  def verified?
    status == 1
  end
end
