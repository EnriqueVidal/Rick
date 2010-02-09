puts "The greetings table doesn't exists!" if !database.table_exists? 'greetings'

migration "Create the greetings table" do
  database.create_table :greetings do
    primary_key   :id
    string        :greeting
    end
    
    clover_greetings = [
                          "Hola soy [name]. Quieres conversar?",
                          "Que pasa por tu mente hoy?",
                          "Hola. De que te gustaria hablar?",
                          "Hola. Como puedo ser de utilidad este dia?"
                      ]
                      
    clover_greetings.each { |greeting| database[:greetings].insert( :greeting => greeting) }
end