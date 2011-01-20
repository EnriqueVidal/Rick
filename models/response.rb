class Response < ActiveRecord::Base
  validates_presence_of :response
  belongs_to :keyword
end