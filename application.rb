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