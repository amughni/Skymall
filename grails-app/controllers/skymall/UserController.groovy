package skymall



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond User.list(params), model:[userInstanceCount: User.count()]
	}

	def show(User userInstance) {
		respond userInstance
	}

	def create() {
		respond new User(params)
	}

	@Transactional
	def save(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}

		userInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
				redirect userInstance
			}
			'*' { respond userInstance, [status: CREATED] }
		}
	}

	def edit(User userInstance) {
		respond userInstance
	}

	@Transactional
	def update(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'edit'
			return
		}

		userInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
				redirect userInstance
			}
			'*'{ respond userInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(User userInstance) {

		if (userInstance == null) {
			notFound()
			return
		}

		userInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def login = {
		render(view:"login")
	}

	//authenticating the user
	def authenticate = {
		def user = User.findByUserNameAndPassword(params.email, params.password)
		if(user){
			session.user = user
			def cart = new Cart()
			session.cart = cart
			cart.user = user;

			flash.message = "Hello ${user.userName}!"
			redirect(controller:"store", action:"index")
		}else{
			flash.message = "Sorry, ${params.email}. Please try again."
			redirect(action:"login")
		}
	}

	//logout
	def logout = {
		flash.message = "Goodbye ${session.user.userName}"
		session.user = null
		session.cart = null
		redirect( action:"login")
	}


	//checkout
	def checkout = {
		//session.user.userRole == 'Shopper'
		int total = 0
		def  prodList = session.cart.productList 
		for ( i in prodList  ) {
			 total = total + i.price
			 
		}
		flash.message = "Your total is " +total
		println flash.message
		render(view:"pay")
}
}