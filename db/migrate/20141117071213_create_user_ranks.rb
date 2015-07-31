class CreateUserRanks < ActiveRecord::Migration
  def change
    create_table :user_ranks do |t|
      t.string :name
      t.text :shift_ranks_allowed
      t.text :description
      t.timestamps
    end
  end
end
