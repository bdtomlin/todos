require 'spec_helper'

feature 'Manage Todos' do
  scenario 'Create a new todo' do
    sign_in
    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some underwear'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some underwear'
  end

  scenario 'view only my todos' do
    Todo.create(description: 'Buy a hat', owner_email: 'not_me@example.com')
    sign_in_as 'me@example.com'

    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some underwear'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some underwear'
    expect(page).not_to have_css 'li.todo', text: 'Buy a hat'
  end
end
