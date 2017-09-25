require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @list = Word.all()
  erb(:input)
end

post('/') do
  vocabulary_word = params['vocabulary_word']
  definition = params['definition']
  new_vocab_word = Word.new(vocabulary_word, definition)
  new_vocab_word.save()
  @list = Word.all()
  erb(:input)
end

get('/words/:id') do
  @word = Word.find(params[:id])
  erb(:finish)
end
