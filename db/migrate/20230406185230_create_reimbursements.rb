class CreateReimbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :reimbursements do |t|
      t.integer :reimbursement_id
      t.string :title
      t.string :description
      t.boolean :approved
      t.integer :user_id

      t.timestamps
    end
    add_index :reimbursements, :reimbursement_id, unique: true
  end
end
