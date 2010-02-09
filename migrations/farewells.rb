puts "The farewells table doesn't exits!" if !database.table_exists? 'farewells'

migration "Create the farewells table" do
  database.create_table :farewells do
    primary_key :id
    string      :farewell
  end
  
  clover_farewells = ["Hasta luego!", "Au revoir!", "Nos vemos"]
  clover_farewells.each { |farewell| database[:farewells].insert( :farewell => farewell ) }
end