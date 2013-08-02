class AddEventIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :event_id, :integer
  end
end
