class Presubs < ActiveRecord::Migration
  def self.up
    create_table :presubs do |t|
      t.string :word
      t.string :substitution
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :presubs
  end
end