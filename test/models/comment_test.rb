# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text(65535)
#  html_content     :text(65535)
#  creator_name     :string(255)
#  creator_email    :string(255)
#  creator_site     :string(255)
#  commentable_id   :integer
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_type :string(255)
#  parent_id        :integer          default(0)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
