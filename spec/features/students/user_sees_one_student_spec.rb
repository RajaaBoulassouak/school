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

describe 'user can create a new address for a student' do
  it 'should create a new student adress' do
    student = Student.create!(name: "Hans")
    description = "Summer Address"
    street = "Road"
    city = "Denver" 
    state = "CO" 
    zip_code = 80202

    visit new_student_path(student)
    
    fill_in "address[description]", with: description
    fill_in "address[street]", with: street
    fill_in "address[city]", with: city
    fill_in "address[state]", with: state
    fill_in "address[zip_code]", with: zip_code
    click_on "Create Address"
    
    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(address.description)
    expect(page).to have_content(address.street)
    expect(page).to have_content(address.city)
    expect(page).to have_content(address.state)
    expect(page).to have_content(address.zip_code)
  end 
end
# 
# describe 'user sees all adresses of the student' do 
#   it 'should show all student adresses' do 
#     student = Student.create!(name: "Hans")
#     adress_1 = student.adresses.create!(description: "Summer Address", street: "Road", city: "Denver", state: "CO", zip_code: 80202)
#     adress_2 = student.adresses.create!(description: "Winter Address", street: "Avenue", city: "Denver", state: "CO", zip_code: 80202)
#   end
# end 

  