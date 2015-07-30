class CreateShiftRanks < ActiveRecord::Migration
  def change
    create_table :shift_ranks do |t|
      t.string :name
      t.text :user_ranks_allowed
      t.text :applicable_shifts
      t.text :description
      t.timestamps
    end
  end
end
