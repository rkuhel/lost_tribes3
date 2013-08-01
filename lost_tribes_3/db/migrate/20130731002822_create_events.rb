class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.integer :creator_id
      

      t.timestamps
    end
  end
end
