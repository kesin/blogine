class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :path, null: false
      t.text :content
      t.text :html_content
      t.integer :status

      t.timestamps
    end
  end
end
