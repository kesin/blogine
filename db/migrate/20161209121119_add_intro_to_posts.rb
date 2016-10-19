class AddIntroToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :intro, :text
  end
end
