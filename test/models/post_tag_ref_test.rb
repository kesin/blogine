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

require 'test_helper'

class PostTagRefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
