class AddDefaultValueToCommentStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :status, :integer, :default => 0
  end
end
