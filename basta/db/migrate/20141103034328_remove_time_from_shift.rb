class RemoveTimeFromShift < ActiveRecord::Migration
  def up
    remove_column :shifts, :time
  end

  def down
    add_column :shifts, :time, :time
  end
end
