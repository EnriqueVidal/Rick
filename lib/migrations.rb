class Migrations
  def self.migrations_needed?
    return  !database.table_exists?('default_responses') && !database.table_exists?('farewells')  && 
            !database.table_exists?('greetings')         && !database.table_exists?('keywords')   &&
            !database.table_exists?('presubs')           && !database.table_exists?('responses')
  end
  
  def self.load_migrations
    require 'yaml'
    require 'migrations/presubs'
    require 'migrations/default_responses'
    require 'migrations/farewells'
    require 'migrations/greetings'
    require 'migrations/keywords'
    require 'migrations/responses'
  end
end