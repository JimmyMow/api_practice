class CreateTrivia < ActiveRecord::Migration
  def change
    create_table :trivia do |t|
      t.string :title

      t.timestamps
    end
  end
end
