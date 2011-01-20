class Farewell < ActiveRecord::Base
  validates_presence_of :farewell
  validates_uniqueness_of :farewell
end