class SetDefaultValueToPostsCount < ActiveRecord::Migration[5.0]
  def change
    change_column :columns, :posts_count, :integer, :default => 0
  end
end
