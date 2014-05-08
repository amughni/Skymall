package skymall

import grails.transaction.Transactional;

class StoreController {

    def index() { 
		if(session.user == null) {
			redirect(controller:"user", action:"login")
			return
		}
			
		def userID = session.user.userName
		def storeList = Store.list()
		
		if(session.user.userRole == "Tenant")
			storeList = Store.findAllByUserName(userID)
		
		render(view:"index", model: [storeInstanceList: storeList])
	}

	
	def  create(){
		if(session.user.userRole != "Tenant") {
			flash.error = message(code: 'default.not.authorized')
			redirect(action: "index")
			return
		}
		def userID = session.user.userName
		respond new Store(userName:userID);
	}
	
	@Transactional
	def save(Store storeInstance) {
		if (storeInstance == null) {
			notFound()
			return
		}
		def userID = session.user.userName
		storeInstance.userName = userID
		
		if (storeInstance.hasErrors()) {
			respond storeInstance.errors, view:'create'
			return
		}

		storeInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'storeInstance.label', default: 'User'), storeInstance.id])
				redirect storeInstance
			}
			'*' { respond storeInstance, [status: CREATED] }
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
	
	def scaffold = Store
}
