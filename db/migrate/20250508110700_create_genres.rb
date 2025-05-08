class CreateGenres < ActiveRecord::Migration[7.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :genre_type
      t.text :description
      t.integer :event_count

      t.timestamps
    end
  end
end
