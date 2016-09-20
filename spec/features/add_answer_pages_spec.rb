require 'rails_helper'
require 'simplecov'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

SimpleCov.start

describe 'the answer creation path' do
  it 'add a question to the list' do
    visit questions_path
    click_link "Add question"
    fill_in "Title", with: "Hello"
    fill_in "Text", with: "Okay then"
    click_on "Create Question"
    expect(page).to have_content('Index')
  end

  it 'add an answer to the quesiton', js: true do
    question = FactoryGirl.create(:question)
    visit questions_path
    click_link "A Question"
    click_link "Add an Answer"
    fill_in "Title", with: "An answer"
    fill_in "Text", with: "the queen of everthing, ruler of unicorns"
    click_on "Create Answer"
    expect(page).to have_content('Boo!')
  end

  it 'add an answer to the quesiton', js: true do
    question = FactoryGirl.create(:question)
    visit questions_path
    click_link "A Question"
    click_link "Add an Answer"
    click_on "Create Answer"
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Text can't be blank")
  end
end
