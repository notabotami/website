class RemoveDayFromShift < ActiveRecord::Migration
  def up
    remove_column :shifts, :day
  end

  def down
    add_column :shifts, :day, :date
  end
end
