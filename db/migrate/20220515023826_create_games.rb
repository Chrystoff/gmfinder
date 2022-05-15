class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :system
      t.integer :difficulty
      t.boolean :mature_content
      t.text :description

      t.timestamps
    end
  end
end
