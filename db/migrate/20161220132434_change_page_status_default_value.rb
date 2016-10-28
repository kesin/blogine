class ChangePageStatusDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :pages, :status, :integer, default: 0
  end
end
