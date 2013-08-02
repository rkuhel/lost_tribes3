class CreateEventsUsersTable < ActiveRecord::Migration
  def change
    create_table :events_users_tables, :id => false do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end
end
