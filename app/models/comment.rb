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
