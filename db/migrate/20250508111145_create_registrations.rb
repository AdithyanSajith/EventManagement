class CreateRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :registrations do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :status
      t.string :source

      t.timestamps
    end
  end
end
