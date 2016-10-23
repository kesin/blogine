class Column < ApplicationRecord

  has_many :posts

  def to_param
    ident
  end

  def saved?
    id && persisted?
  end

end
