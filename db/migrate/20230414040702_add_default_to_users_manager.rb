class AddDefaultToUsersManager < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :manager, false
  end
end
