class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  def verified?
    status == 1
  end
end
