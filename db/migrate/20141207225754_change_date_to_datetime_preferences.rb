class ChangeDateToDatetimePreferences < ActiveRecord::Migration
  def up
    change_column :preferences, :start_date, :datetime
    change_column :preferences, :end_date, :datetime
  end

  def down
    change_column :preferences, :start_date, :date
    change_column :preferences, :end_date, :date
  end
end
