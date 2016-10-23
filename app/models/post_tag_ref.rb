class PostTagRef < ApplicationRecord
  belongs_to :tag, counter_cache: :posts_count
  belongs_to :post
end
