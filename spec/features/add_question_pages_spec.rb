require 'rails_helper'
require "spec_helper"
require 'simplecov'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

SimpleCov.start

describe 'the question creation path' do
  it 'add a question to the list' do
    visit questions_path
    click_link "Add question"
    fill_in "Title", with: "Hello"
    fill_in "Text", with: "Okay then"
    click_on "Create Question"
    expect(page).to have_content('Index')
  end
end
