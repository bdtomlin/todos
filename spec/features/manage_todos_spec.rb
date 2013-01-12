require 'spec_helper'

feature 'Manage Todos' do
  scenario 'Create a new todo' do
    visit root_path
    fill_in 'Email address', with: 'person@example.com'
    click_button 'Sign In'
    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some underwear'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some underwear'
  end
end
