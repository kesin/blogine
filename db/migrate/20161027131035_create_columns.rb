class CreateColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :columns do |t|
      t.string :name
      t.string :ident
      t.integer :posts_count

      t.timestamps
    end
  end
end
