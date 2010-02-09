class Keyword < Sequel::Model
  Response = "response"
  one_to_many :responses
end