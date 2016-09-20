require 'rails_helper'
require "spec_helper"
require 'simplecov'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

SimpleCov.start

describe 'the question creation path' do

  it 'add an answer to the quesiton', js: true do
    visit root_path
    click_link "Add question"
    fill_in "Title", with: "I am a pancake"
    fill_in "Text", with: "Tell me why"
    click_on "Create Question"
    expect(page).to have_content("I am a pancake")
    expect(page).to have_content("Tell me why")
  end
end
