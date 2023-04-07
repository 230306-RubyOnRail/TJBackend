class CreateReimbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :reimbursements do |t|
      t.string :title
      t.string :description
      t.boolean :approved
      t.references :user, null: false, foreign_key: true

    end
  end
end
