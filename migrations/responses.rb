puts "The responses table doesn't exists!" if !database.table_exists? 'responses'

migration "Create the responses table" do
  database.create_table :responses do
    primary_key :id
    text        :response
    foreign_key :keyword_id, :keywords
  end
  
  content           = File.new( Dir.pwd + '/migrations/records/responses.yml' )
  clover_responses  = YAML::load content
                      
  clover_responses['responses'].each do |response| 
    database[:responses].insert( :response => response['response'], :keyword_id => response['keyword_id'] ) 
  end
  
  content.close
end