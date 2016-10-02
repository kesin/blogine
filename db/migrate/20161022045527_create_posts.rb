class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :ident
      t.text :content
      t.text :html_content
      t.integer :column_id
      t.integer :status

      t.timestamps
    end
  end
end
