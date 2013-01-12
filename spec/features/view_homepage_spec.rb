require 'spec_helper'

feature 'View the homepage' do
  scenario 'user sees relevant information' do
    visit root_path
    expect(first('title').native.text).to eq "Todos"
    expect(page).to have_css '[data-role="description"]'
  end
end
