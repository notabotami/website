class CreateTempls < ActiveRecord::Migration
  def change
    create_table :templs do |t|
      t.string :name

      t.timestamps
    end
  end
end
