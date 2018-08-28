require 'rails_helper'

describe 'user can see all students' do
  it 'shows all students' do
    student_1 = Student.create!(name: "Hans")
    student_2 = Student.create!(name: "Lara")

    visit students_path

    expect(current_path).to eq(students_path)
    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_2.name)
  end
  
  describe 'user clicks on a specific student name' do
    it 'should link to the show page of that student' do 
      student_1 = Student.create!(name: "Hans")
      student_2 = Student.create!(name: "Lara")

      visit students_path
      click_link(student_1.name)

      expect(current_path).to eq(student_path(student_1))
      expect(page).to have_content(student_1.name)
      expect(page).to_not have_content(student_2.name)
    end 
  end
end
  
describe 'user can create a new student from students index page' do
  it 'should link to create the new student form' do
    student_1 = Student.create!(name: "Hans")
    student_2 = Student.create!(name: "Lara")

    visit students_path
    click_link "Add New Student"

    expect(current_path).to eq(new_student_path)
  end
end
  