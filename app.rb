
require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/definer')
require ('pry')

get('/')do
  @word = Word.all
  erb(:input)
end

post ('/') do 
