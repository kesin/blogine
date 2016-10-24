class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.text :html_content
      t.string :creator_name
      t.string :creator_email
      t.string :creator_site
      t.integer :post_id
      t.integer :status

      t.timestamps
    end
  end
end
