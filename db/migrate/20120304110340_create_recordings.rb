class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :artist
      t.string :title
      t.date :published

      t.timestamps
    end
  end
end
