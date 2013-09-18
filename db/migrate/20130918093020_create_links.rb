class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :counter
      t.string :original_link
      t.string :shortened_link
      t.timestamps
    end 
  end
end
