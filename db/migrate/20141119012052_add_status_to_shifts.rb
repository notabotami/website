class AddStatusToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :status, :string
  end
end
