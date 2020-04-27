class CreateThres < ActiveRecord::Migration[6.0]
  def change
    create_table :thres do |t|
      t.string :title, null: false
      t.string :username, null: false
      t.string :useremail
      t.string :userid, null: false
      t.text :body, null: false
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
