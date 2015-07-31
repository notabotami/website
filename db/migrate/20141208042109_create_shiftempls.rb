class CreateShiftempls < ActiveRecord::Migration
  def change
    create_table :shiftempls do |t|
      t.string :section
      t.datetime :start_time
      t.references :templ

      t.timestamps
    end
    add_index :shiftempls, :templ_id
  end
end
