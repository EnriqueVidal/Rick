require 'active_record'
require 'will_paginate'
require 'haml'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database =>  'bot.db'
)


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