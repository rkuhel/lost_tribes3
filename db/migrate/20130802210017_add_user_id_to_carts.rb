class AddUserIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :user_id, :integer, null: false
    add_column :carts, :current, :boolean, default: true
  end
end
