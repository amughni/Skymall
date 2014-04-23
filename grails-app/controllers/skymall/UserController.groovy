package skymall

class UserController {

	def index() { }
	
	def login(){
		redirect(controller:'Store', action:'list')
	}
}
