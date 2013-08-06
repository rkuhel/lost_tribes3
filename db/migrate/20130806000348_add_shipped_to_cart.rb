class AddShippedToCart < ActiveRecord::Migration
  def change
    add_column :carts, :shipped, :boolean, default: false  
  end
end
