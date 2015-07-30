class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.date :day
      t.time :time
      t.string :section
      t.references :user

      t.timestamps
    end
    add_index :shifts, :user_id
  end
end
