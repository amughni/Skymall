package skymall

import grails.transaction.Transactional;

class ElectronicsController {

    def index() { }
	
	def list(){
		//render params.id
		def electronicsList = Electronics.findAllByStoreID(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [electronicsInstanceList: electronicsList])
	}
	
	def  create(){
		def storeid = flash.storeID
		respond new Electronics(storeID:storeid);
	}
	
	
	@Transactional
	def save(Electronics electronicsInstance) {
		if (electronicsInstance == null) {
			notFound()
			return
		}

		if (electronicsInstance.hasErrors()) {
			respond electronicsInstance.errors, view:'create'
			return
		}
		
		def _toBeDeleted = electronicsInstance.variants.findAll {it._deleted}
		if (_toBeDeleted) {
			electronicsInstance.variants.removeAll(_toBeDeleted)
		}
		electronicsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'electronicsInstance.label', default: 'Electronic Product'), electronicsInstance.id])
				redirect electronicsInstance
			}
			'*' { respond electronicsInstance, [status: CREATED] }
		}
	}
	
	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'electronicsInstance.label', default: 'Electronic Product'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
	
	def scaffold = Electronics
}
