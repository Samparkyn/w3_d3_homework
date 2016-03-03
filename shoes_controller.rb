require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('models/shoes')

get '/shoe' do
  @shoes = Shoe.all()
  erb(:index)
end

get '/shoe/new' do
  erb(:new)
end

post '/shoe' do
  @shoe = Shoe.new(params)
  @shoe.save()
  erb(:create)
end