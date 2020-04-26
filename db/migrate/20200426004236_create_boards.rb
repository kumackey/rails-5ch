class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :default_username, null: false
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
