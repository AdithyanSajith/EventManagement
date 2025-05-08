class CreateParticipants < ActiveRecord::Migration[7.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.text :interest
      t.string :city
      t.date :birthdate
      t.string :number

      t.timestamps
    end
  end
end
