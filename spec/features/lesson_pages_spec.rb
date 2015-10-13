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

describe "the edit lesson path" do
  it "edits a lesson" do
    lesson = Lesson.create(name: "CSS", content: "CSS stuff", number: 9)
    visit lesson_path(lesson)
    click_on "Edit"
    fill_in "Number", :with => 12
    click_on "Update Lesson"
    expect(page).to have_content "Lessons"
  end

  it "gives error when a field is empty" do
    lesson = Lesson.create(name: "CSS", content: "CSS stuff", number: 9)
    visit lesson_path(lesson)
    click_on "Edit"
    fill_in "Number", :with => ''
    click_on "Update Lesson"
    expect(page).to have_content "errors"
  end
end
