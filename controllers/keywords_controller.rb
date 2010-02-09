get '/keywords' do
  @keywords = Keyword.all
  haml :keywords
end

get '/keyword/new' do
  haml :new_keyword
end

get '/keyword/:id' do |id|
  @keyword = Keyword.find(:id => id)
  haml :show_keyword
end