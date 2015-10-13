require 'rails_helper'

describe "the add a lesson process" do
  it "adds a new lesson" do
    visit lessons_path
    click_on "New Lesson"
    fill_in 'Name', :with => 'HTML'
    fill_in 'Content', :with => 'stuff'
    fill_in 'Number', :with => 8
    click_on "Create Lesson"
    expect(page).to have_content 'Lessons'
  end

  it "gives an error when no name, content, or number is entered" do
    visit new_lesson_path
    click_on "Create Lesson"
    expect(page).to have_content 'errors'
  end
end
