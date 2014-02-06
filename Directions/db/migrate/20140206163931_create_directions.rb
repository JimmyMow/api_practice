class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :start
      t.string :finish

      t.timestamps
    end
  end
end
