class AddEmailToTrivium < ActiveRecord::Migration
  def change
    add_column :trivia, :email, :string
  end
end
