class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true

          end
  end
end
