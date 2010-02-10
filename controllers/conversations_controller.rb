bot = nil

get '/conversation' do
  bot =  Bot.new( :name => 'rick' )
  
  @conversation = {}
  @conversation[:response]  = bot.greeting
  @conversation[:name]      = bot.name
  
  haml :conversation
end

post '/conversation' do
  phrase = params[:phrase].gsub(/[^a-zA-Z0-9@\-\_\?\.\s]/, '')
  
  "#{ bot.name } says: #{ bot.response_to phrase }"
end
