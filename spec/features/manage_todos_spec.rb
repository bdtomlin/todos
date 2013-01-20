require 'spec_helper'

feature 'Manage Todos' do
  scenario 'Create a new todo' do
    sign_in
    create_todo_with_description 'Buy some underwear'
    user_sees_todo_item('Buy some underwear')
  end

  scenario 'view only my todos' do
    create(:todo, description: 'Buy a hat', owner_email: 'not_me@example.com')
    sign_in_as 'me@example.com'
    create_todo_with_description 'Buy some underwear'
    user_sees_todo_item('Buy some underwear')
    user_does_not_see_todo_item 'Buy a hat'
  end

  scenario 'mark todos as complete' do
    sign_in
    create_todo_with_description 'Buy some underwear'
    complete_todo 'Buy some underwear'
    expect(page).to have_css 'li.todo.completed'
  end

  private
    def complete_todo(description)
      within "li.todo:contains('#{description}')" do
        click_link 'Complete'
      end
      user_sees_completed_todo_item('Buy some underwear')
    end

    def create_todo_with_description(description)
      click_link 'Add a new todo'
      fill_in 'Description', with: description
      click_button 'Create todo'
    end

    def user_sees_todo_item(description)
      expect(page).to have_css 'li.todo', text: description
    end

    def user_sees_completed_todo_item(description)
      expect(page).to have_css 'li.todo.completed', text: description
    end

    def user_does_not_see_todo_item(description)
      expect(page).to_not have_css 'li.todo', text: description
    end
end
