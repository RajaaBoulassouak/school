require 'rails_helper'

describe 'user can edit a student' do
  describe 'they fill out the form' do
    it 'updates the student with new information' do
      student = Student.create!(name: "Hans")
      student_name = "Jojo"
      
      visit edit_student_path(student)
      fill_in 'student[name]', with: student_name
      click_on "Update Student"
      
      expect(current_path).to eq(student_path(student))
      expect(page).to have_content(student_name)
      expect(page).to_not have_content("Hans")
    end 
  end  
end

describe 'user can create a new student from students edit page' do
  it 'should link to create a new student form' do
    student = Student.create!(name: "Hans")

    visit edit_student_path(student)
    click_link "Add New Student"

    expect(current_path).to eq(new_student_path)
  end
end

describe 'user can see all students from edit student page' do
  it 'should link to index page' do
    student = Student.create!(name: "Hans")
  
    visit edit_student_path(student)
    click_link "See All Students"

    expect(current_path).to eq(students_path)
  end
end