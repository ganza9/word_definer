require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, true)


describe('defining a word', {:type => :feature})do
  it('processes the user entry of both word and definition and returns the word')do
    visit('/')
    fill_in('vocabulary_word', :with => 'Rugby')
    fill_in('definition', :with => 'A game for hooligans played by gentlemen')
    click_button('Submit')
    expect(page).to have_content('Rugby')
  end
end

describe('viewing definition', {:type => :feature})do
  it('shows the word and definition')do
  visit('/')
    click_link('Rugby')
    expect(page).to have_content('Rugby: A game for hooligans played by gentlemen')
  end
end
