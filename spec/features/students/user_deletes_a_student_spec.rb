require 'rails_helper'

describe 'user can delete a student' do 
  it 'should delete a student' do 
    student_1 = Student.create!(name: "Hans")
    student_2 = Student.create!(name: "Lara")
    
    visit students_path
    within("#student-#{student_1.id}") do
      click_link "Delete"
    end
    
    expect(page).to_not have_content(student_1.name)
    expect(page).to have_content(student_2.name)
  end 
end 