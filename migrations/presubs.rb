puts "The presubs table doesn't exist!" if !database.table_exists? 'presubs'

migration "Create the presubs table" do
  database.create_table :presubs do
   primary_key  :id
   string       :word
   string       :substitution 
  end
  
  content               = File.new( Dir.pwd + '/migrations/records/presubs.yml' )
  clover_substitutions  = YAML::load content
                          
  clover_substitutions['presubs'].each { |presub| database[:presubs].insert( :word => presub['word'], :substitution => presub['substitution'] ) }
  content.close
end