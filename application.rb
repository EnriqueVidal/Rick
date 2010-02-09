ENV['GEM_PATH'] = "#{ENV['HOME']}/ruby/gems:/usr/lib/ruby/gems/1.8" if `hostname` =~ /\.(com|net|mx|edu|org|us)$/
ENV['GEM_HOME'] = "#{ENV['HOME']}/ruby/gems" if `hostname` =~ /\.(com|net|mx|edu|org|us)$/


require 'rubygems'
require 'yaml'
require 'sinatra'
require 'sinatra/sequel'
require 'haml'

set     :environment,  :production if `hostname` =~ /\.(com|net|mx|edu|org|us)$/
disable :run if `hostname` =~ /\.(com|net|mx|edu|org|us)$/



set :database, 'sqlite://bot.db'

# Requiring migrations
require 'migrations/presubs'
require 'migrations/default_responses'
require 'migrations/farewells'
require 'migrations/greetings'
require 'migrations/keywords'
require 'migrations/responses'

# Requiring models
require 'models/keyword'
require 'models/response'
require 'models/greeting'
require 'models/farewell'
require 'models/presub'
require 'models/default_response'

require 'lib/bot'

load 'controllers/conversations_controller.rb'
load 'controllers/keywords_controller.rb'