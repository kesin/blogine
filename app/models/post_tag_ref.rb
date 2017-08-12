# == Schema Information
#
# Table name: post_tag_refs
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostTagRef < ApplicationRecord
  belongs_to :tag, counter_cache: :posts_count
  belongs_to :post
end
