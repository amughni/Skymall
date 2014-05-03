package skymall

import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;

import grails.transaction.Transactional;

class ApparelController {

    def index() { }
	
	def list(){
		//render params.id
		def apparelList = Apparel.findAllByStoreID(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [apparelInstanceList: apparelList])
	}
	
	def  create(){
		//def storeid = params.id
		def storeid = flash.storeID
		respond new Apparel(storeID:storeid);
	}
	
	@Transactional
	def save(Apparel apparelInstance) {
        if (apparelInstance == null) {
            notFound()
            return
        }

        if (apparelInstance.hasErrors()) {
            respond apparelInstance.errors, view:'create'
            return
        }

        apparelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'apparelInstance.label', default: 'User'), apparelInstance.id])
                redirect apparelInstance
            }
            '*' { respond apparelInstance, [status: CREATED] }
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
	
	def scaffold = Apparel
}
