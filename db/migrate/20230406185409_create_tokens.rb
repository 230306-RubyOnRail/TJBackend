class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.integer :token_id
      t.string :token
      t.integer :user_id

      t.timestamps
    end
    add_index :tokens, :token_id, unique: true
  end
end
