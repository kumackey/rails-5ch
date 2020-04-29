class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.string :username, null: false
      t.string :useremail
      t.string :userid, null: false
      t.text :body, null: false
      t.references :thre, foreign_key: true
      
      t.timestamps
    end
  end
end
