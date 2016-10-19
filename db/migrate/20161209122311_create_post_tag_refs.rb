class CreatePostTagRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :post_tag_refs do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
