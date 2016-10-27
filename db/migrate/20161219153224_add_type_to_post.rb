class AddTypeToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :type, :string
  end
end
