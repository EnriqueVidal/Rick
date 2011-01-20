class Presub < ActiveRecord::Base
  validates_presence_of :word, :substitution
  validates_uniqueness_of :word
end