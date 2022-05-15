class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.time :time
      t.integer :length
      t.text :description
      t.references :game, null: false, foreign_key: true
      t.references :gamemaster, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
