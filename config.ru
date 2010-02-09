ENV['GEM_PATH'] = "#{ENV['HOME']}/ruby/gems:/usr/lib/ruby/gems/1.8" if `hostname` =~ /\.(com|net|mx|edu|org|us)$/
ENV['GEM_HOME'] = "#{ENV['HOME']}/ruby/gems"                        if `hostname` =~ /\.(com|net|mx|edu|org|us)$/


require 'rubygems'
require 'yaml'
require 'sinatra'
require 'sinatra/sequel'
require 'haml'

set     :environment,  :production  if `hostname` =~ /\.(com|net|mx|edu|org|us)$/
disable :run                        if `hostname` =~ /\.(com|net|mx|edu|org|us)$/

require 'application'