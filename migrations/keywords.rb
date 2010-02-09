puts "The keywords table doesn't exists!" if !database.table_exists? 'keywords'

migration "Create the keywords table" do
  database.create_table :keywords do
    primary_key :id
    string      :keyword
  end
  
  content           = File.new( Dir.pwd + '/migrations/records/keywords.yml' )
  clover_keywords   = YAML::load content
                    
  clover_keywords['keywords'].each { |keyword| database[:keywords].insert( :keyword => keyword ) }
  content.close
end