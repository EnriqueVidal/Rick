namespace :db do
  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger       = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
  
  desc "Remove Migrations"
  task(:drop => :environment) do
    ActiveRecord::Base.logger       = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.down("db/migrate")
  end
end

desc "Load ActiveRecord and connect"
task :environment do
  require 'active_record'
  
  ActiveRecord::Base.establish_connection(
    :adapter  =>  'sqlite3',
    :database =>  'test.db'
  )
end