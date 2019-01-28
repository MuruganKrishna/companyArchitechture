class Api::V1::NamesController<ApplicationController
def showname
#    emp=params.permit(:name)
  
   name=[]
   Employee.all.each do |d|
    name.push(d.name)
   end
   
   render json: name
end
end