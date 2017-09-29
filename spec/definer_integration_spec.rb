require('sinatra')
require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('seeing the definitions for a single word', {:type => :feature}) do
  it('allows a user to see a word they just entered into their list of words') do
    test_word = Word.new({:vocabulary_word => "vocabulary_word", :definition => "A definition for a vocab word", :id => nil})
    test_word.save()
    visit('/')
    expect(page).to have_content(test_word.vocabulary_word)
  end
end

describe('adding a new vocabulary word', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    Word.clear
    visit('/')
    fill_in('vocabulary_word', :with =>'rat')
    fill_in('definition', :with =>'a rodent that resembles a large mouse')
    click_button('Submit')
    expect(page).to have_content('rat')
  end
end

describe('adding a new vocabulary word', {:type => :feature}) do
  it('allows a user to click a word to see the words and definitions') do
    Word.clear
    visit('/')
    fill_in('vocabulary_word', :with =>'rat')
    fill_in('definition', :with =>'a rodent that resembles a large mouse')
    click_button('Submit')
    click_link('rat')
    expect(page).to have_content('rat')
    expect(page).to have_content('a rodent that resembles a large mouse')
  end
end

describe(".find" , {:type => :feature}) do
  it("returns a word by its ID") do
    test_word = Word.new({:vocabulary_word => "12312vocabulary_word", :definition => "A definition for a vocab word", :id => nil})
    test_word.save()
    test_word2 = Word.new({:vocabulary_word => "A second vocabulary_word", :definition => "A second definition for a vocab word", :id => nil})
    test_word2.save()
    expect(Word.find(test_word2.id())).to(eq(test_word2))
  end
end

describe('adding a new definition to a word', {:type => :feature}) do
  it('allows a user to add a word to a list of vocab words') do
    Word.clear
    visit('/')
    fill_in('vocabulary_word', :with =>'rat')
    fill_in('definition', :with =>'a rodent that resembles a large mouse')
    click_button('Submit')
    fill_in('vocabulary_word', :with =>'cat')
    fill_in('definition', :with =>'a predator of mice')
    click_button('Submit')
    click_link('cat')
    expect(page).to have_content('cat')
    fill_in('definition', :with =>'a feline')
      click_button('Submit')
    expect(page).to have_content('feline')
  end
end
