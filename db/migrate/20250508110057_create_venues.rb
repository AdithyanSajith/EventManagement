class CreateVenues < ActiveRecord::Migration[7.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.text :description
      t.integer :event_count
      t.integer :zipcode

      t.timestamps
    end
  end
end
