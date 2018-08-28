require 'rails_helper'

describe 'user can see one student' do
  it 'should show one student' do
    student = Student.create!(name: "Hans")

    visit student_path(student)

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(student.name)
  end
end
    
describe 'user can create a new student from student show page' do
  it 'should link to create the new student form' do
    student = Student.create!(name: "Hans")
  
    visit student_path(student)
    click_link "Add New Student"

    expect(current_path).to eq(new_student_path)
  end
end

describe 'user can see all students from student show page' do
  it 'should link to index page' do
    student = Student.create!(name: "Hans")
  
    visit student_path(student)
    click_link "See All Students"

    expect(current_path).to eq(students_path)
  end
end