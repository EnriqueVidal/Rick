class Response < Sequel::Model
  Keyword = "keyword"
    
  many_to_one :keyword
end