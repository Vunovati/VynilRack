class AddUserIdToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :user_id, :integer

  end
end
