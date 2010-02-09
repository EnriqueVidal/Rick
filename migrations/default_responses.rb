puts "The default responses table doen't exists!" if !database.table_exists? 'default_responses'

migration "Create the default responses table" do
  database.create_table :default_responses do
    primary_key :id
    string      :response
  end
  
  content         = File.new( Dir.pwd + '/migrations/records/default_responses.yml' )
  clover_default = YAML::load content
                    
  clover_default['default_responses'].each { |default_response| database[:default_responses].insert( :response => default_response ) }
  content.close
end