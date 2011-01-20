class DefaultResponses < ActiveRecord::Migration
  def self.up
    create_table :default_responses do |t|
      t.string  :response
      
      t.timestamps
    end
  end

  def self.down
    drop_table :default_responses
  end
end

