get '/keywords' do
  limit, page   = 5, params[:page].to_i || 1
  start         = ( page.to_i - 1 ) * limit   if page - 1 >= 1
  start       ||= 1
  
  @keywords = Keyword.all( :limit => "#{start}, #{limit}" )
  haml :keywords
end

get '/keyword/new' do
  @keyword = Keyword.new
  @keyword.responses.build
  
  haml :new_keyword
end

get '/keyword/:id' do |id|
  @keyword = Keyword.find id
  haml :show_keyword
end

get '/keyword/:id/edit' do |id|
  @keyword = Keyword.find id
  haml :edit_keyword
end

post '/keyword' do
end