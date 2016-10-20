class RemoveIdentFromTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :ident
  end
end
