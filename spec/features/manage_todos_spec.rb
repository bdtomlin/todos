require 'spec_helper'

feature 'Manage Todos' do
  scenario 'Create a new todo' do
    sign_in
    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some underwear'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some underwear'
  end
end
