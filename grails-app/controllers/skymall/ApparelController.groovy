package skymall

import grails.transaction.Transactional;

class ApparelController {

	def index() {
	}

	def list(){
		//render params.id
		def apparelList = Apparel.findAllByStoreID(params.id)
		flash.storeID = params.id
		render(view:"index", model: [apparelInstanceList: apparelList])
	}

	def  create(){
		def storeid = flash.storeID
		respond new Apparel(storeID:storeid);
	}

	def update()  {
		def apparelInstance = Apparel.get( params.id )
		if(apparelInstance) {
			if(params.version) {
				def version = params.version.toLong()
				if(apparelInstance.version > version) {
					apparelInstance.errors.rejectValue("version", "", "Another user has updated this product while you were editing.")
					render(view:'edit',model:[apparelInstance:apparelInstance])
					return
				}
			}
			apparelInstance.properties = params
			def _toBeDeleted = apparelInstance.variants.findAll {it._deleted}
			if (_toBeDeleted) {
				apparelInstance.variants.removeAll(_toBeDeleted)
			}

			if(!apparelInstance.hasErrors() && apparelInstance.save()) {
				flash.message = "Apparel ${params.id} updated"
				redirect(action:show,id:apparelInstance.id)
			}
			else {
				render(view:'edit',model:[apparelInstance:apparelInstance])
			}
		}
		else {
			flash.message = "product not found with id ${params.id}"
			redirect(action:list)
		}
	}
	
	def add(){
		def apparelInstance = Apparel.get( params.id )
		
	}
	//	@Transactional
	//	def save(Apparel apparelInstance) {
	//        if (apparelInstance == null) {
	//            notFound()
	//            return
	//        }
	//
	//        if (apparelInstance.hasErrors()) {
	//            respond apparelInstance.errors, view:'create'
	//            return
	//        }
	//
	//        apparelInstance.save flush:true
	//
	//        request.withFormat {
	//            form multipartForm {
	//                flash.message = message(code: 'default.created.message', args: [message(code: 'apparelInstance.label', default: 'User'), apparelInstance.id])
	//                redirect apparelInstance
	//            }
	//            '*' { respond apparelInstance, [status: CREATED] }
	//        }
	//    }
	//
	//	protected void notFound() {
	//		request.withFormat {
	//			form multipartForm {
	//				flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
	//				redirect action: "index", method: "GET"
	//			}
	//			'*'{ render status: NOT_FOUND }
	//		}
	//	}

	def scaffold = Apparel
}
