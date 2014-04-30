package skymall

class UserControllerOld {

	def index() { }
	
	def login(){
		//if(value == "Login")
		redirect(controller:'Store', action:'index')
		//if(value == "Register")
		//redirect(controller:'User', action:'create')
	}
	
	def create()
	{
		render(view: "create")
	}
	
	
}
