class DefaultResponse < ActiveRecord::Base
  validates_presence_of   :response
  validates_uniqueness_of :response
end