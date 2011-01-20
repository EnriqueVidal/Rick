class Farewells < ActiveRecord::Migration
  def self.up
    create_table :farewells do |t|
      t.string :farewell
      t.timestamps
    end
  end
  
  def self.down
    drop_table :farewells
  end
end