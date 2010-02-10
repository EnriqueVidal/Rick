ENV['GEM_PATH'] = "#{ENV['HOME']}/ruby/gems:/usr/lib/ruby/gems/1.8" if `hostname` =~ /\.(com|net|mx|edu|org|us)$/
ENV['GEM_HOME'] = "#{ENV['HOME']}/ruby/gems"                        if `hostname` =~ /\.(com|net|mx|edu|org|us)$/
ENV['GEM_HOME'] = "/opt/local/lib/ruby/gems/1.8"                    if `hostname` =~ /\.local$/

require 'rubygems'
require 'sinatra'
require 'application'

run Sinatra::Application