
require ('sinatra')
require('sinatra/base')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/word')
require ('./lib/definition')
require ('pry')

get ('/') do
  @def_words = Word.all
  @defined = Definition.all
  erb(:input)
end

post ('/') do
  @word = params.fetch('word')
  attributes = @word
  @def_word = Word.new(attributes)
  @def_word.save()
  @def_words = Word.all
  erb(:input)
end

post ('/output') do
  @definition = params.fetch('definition')
  attributes = {:definition=> @definition}
  @define = Definition.new(attributes)
  @define.save()
  @defined = Definition.all
  erb(:output)
end

get ('/output/:id') do
  @def_words = Word.find(params[:id])
  @defined = Definition.find(params[:id])
  erb(:output)
end

get('/finish/:id')do
  @def_words = Word.all
  @defined = Definition.all
  erb(:finish)
end
