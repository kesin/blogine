class Tag < ApplicationRecord

  def to_param
    name
  end

  def saved?
    id && persisted?
  end
end
