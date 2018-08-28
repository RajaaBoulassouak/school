def new 
  @student = Student.find(params[:student_id])
  @address = Address.new
end

def create
  student = Student.find(params[:student_id])
  address = student.addresss.create!(address_params)
  redirect_to student_path(student)
end 

private 
  def address_params 
    params.require(:address).permit(:description, :street, :city, :state, :zip_code)
  end 
end