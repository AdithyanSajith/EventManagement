class CreateHosts < ActiveRecord::Migration[7.2]
  def change
    create_table :hosts do |t|
      t.text :bio
      t.string :organisation
      t.string :website
      t.string :number
      t.string :string

      t.timestamps
    end
  end
end
