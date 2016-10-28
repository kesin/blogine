class AddCommentsCountToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :comments_count, :integer, default: 0
  end
end
