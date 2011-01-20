class Responses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.text     :response
      t.integer  :keyword_id
    end
  end
  
  def self.down
    drop_table :responses
  end
end