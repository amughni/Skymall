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

			// Getting the file
			def f = request.getFile('image')

			// List of OK mime-types
			if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
				flash.message = "File must be one of: ${ProductController.okcontents}"
				respond apparelInstance.errors, view:'create'
				return
			}
			if (f.size > 0){
				// Save the image and mime type
				apparelInstance.image = f.bytes
				apparelInstance.imageType = f.contentType
			}

			apparelInstance.properties = params
			def _toBeDeleted = apparelInstance.variants.findAll {it._deleted}
			if (_toBeDeleted) {
				apparelInstance.variants.removeAll(_toBeDeleted)
			}

			if(!apparelInstance.hasErrors() && apparelInstance.save()) {
				flash.message = "Apparel ${params.id} updated"
				render (view:'show',model:[apparelInstance:apparelInstance])
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
	
	def save(Apparel apparelInstance) {
		if (apparelInstance == null) {
			notFound()
			return
		}

		if (apparelInstance.hasErrors()) {
			respond apparelInstance.errors, view:'create'
			return
		}

		// Getting the file
		def f = request.getFile('image')

		// List of OK mime-types
		if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
			flash.message = "File must be one of: ${ProductController.okcontents}"
			respond apparelInstance.errors, view:'create'
			return
		}
		if (f.size > 0){
			// Save the image and mime type
			apparelInstance.image = f.bytes
			apparelInstance.imageType = f.contentType
		}

		apparelInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'apparelInstance.label', default: 'User'),
					apparelInstance.id
				])
				redirect apparelInstance
			}
			'*' { respond apparelInstance, [status: CREATED] }
		}
	}
	def getImage() {
		def apparel = Apparel.get(params.id)
		if (!apparel || !apparel.image || !apparel.imageType) {
			response.sendError(404)
			return
		}
		response.contentType = apparel.imageType
		response.contentLength = apparel.image.size()
		OutputStream out = response.outputStream
		out.write(apparel.image)
		out.close()
	}

	def scaffold = Apparel
}
