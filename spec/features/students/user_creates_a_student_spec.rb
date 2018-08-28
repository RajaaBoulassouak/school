require 'rails_helper'

describe 'user can create a new student' do
  describe 'they fill in the form' do
    it 'creates the new student' do
      student_name = "Jojo"
      
      visit new_student_path
      fill_in "student[name]", with: student_name
      click_on("Create Student")
      
      expect(current_path).to eq(student_path(Student.last))
      expect(page).to have_content(Student.last.name)
      expect(page).to have_content(student_name)
    end
  end
end

describe 'user can see all students from create student page' do
  it 'should link to index page' do
  
    visit new_student_path
    click_link "See All Students"

    expect(current_path).to eq(students_path)
  end
end