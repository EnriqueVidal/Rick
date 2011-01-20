class Greetings < ActiveRecord::Migration
  def self.up
    create_table :greetings do |t|
      t.string :greeting
      t.timestamps
    end
  end
  
  def self.down
    drop_table :greetings
  end
end