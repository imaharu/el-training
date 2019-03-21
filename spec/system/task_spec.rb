require 'rails_helper'

RSpec.feature "Tasks", type: :system  do

  background do
     @task = Task.create(name: 'タスク確認', content: '内容確認', closed_on: Time.now)
  end

  scenario "#index" do
    visit root_path
    expect(page).to have_content 'タスク確認'
  end

  scenario "#new" do
    visit new_task_path
    fill_in 'task[name]', with: 'new_task_name'
    fill_in 'task[content]', with: 'new_task_content'
    fill_in 'task[closed_on]', with: Time.now
    click_button 'Create Task'
    expect(page).to have_content 'タスクの「new_task_name」を登録しました。'
  end
end
