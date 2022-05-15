class CreateGamemasters < ActiveRecord::Migration[7.0]
  def change
    create_table :gamemasters do |t|
      t.string :name
      t.integer :experience
      t.string :availability
      t.text :about

      t.timestamps
    end
  end
end
