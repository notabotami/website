class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :preferences, :type, :the_type
  end

  def down
  end
end
