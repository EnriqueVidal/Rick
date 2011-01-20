class Greeting < ActiveRecord::Base
  validates_presence_of :greeting
  validates_uniqueness_of :greeting
end