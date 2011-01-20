class Keyword < ActiveRecord::Base
  validates_presence_of :keyword
  has_many :responses
  
  accepts_nested_attributes_for :responses, :reject_if => lambda { |response| response[:reponse].blank? }, :allow_destroy => true
end