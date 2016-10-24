class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  scope :verified, -> {where(status: 1)}

  def verified?
    status == 1
  end
end
