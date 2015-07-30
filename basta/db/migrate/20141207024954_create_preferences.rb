class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.date :start_date
      t.date :end_date
      t.string :type
      t.boolean :okayed
      t.references :user

      t.timestamps
    end
    add_index :preferences, :user_id
  end
end
