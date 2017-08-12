# == Schema Information
#
# Table name: columns
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  ident       :string(255)
#  posts_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Column < ApplicationRecord

  has_many :posts

  def to_param
    ident
  end

  def saved?
    id && persisted?
  end

end
