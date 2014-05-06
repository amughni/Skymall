package skymall

import grails.transaction.Transactional;

class ElectronicsController {

	def index() {
	}

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


	def update()  {
		def electronicsInstance = Electronics.get( params.id )
		if(electronicsInstance) {
			if(params.version) {
				def version = params.version.toLong()
				if(electronicsInstance.version > version) {
					electronicsInstance.errors.rejectValue("version", "", "Another user has updated this product while you were editing.")
					render(view:'edit',model:[electronicsInstance:electronicsInstance])
					return
				}
			}
			// Getting the file
			def f = request.getFile('image')

			// List of OK mime-types
			if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
				flash.message = "File must be one of: ${ProductController.okcontents}"
				respond electronicsInstance.errors, view:'create'
				return
			}

			if (f.size > 0){
				// Save the image and mime type
				electronicsInstance.image = f.bytes
				electronicsInstance.imageType = f.contentType
			}
			electronicsInstance.properties = params
			def _toBeDeleted = electronicsInstance.variants.findAll {it._deleted}
			if (_toBeDeleted) {
				electronicsInstance.variants.removeAll(_toBeDeleted)
			}

			if(!electronicsInstance.hasErrors() && electronicsInstance.save()) {
				flash.message = "Electronic Item ${params.id} updated"
				render(view:'show',model:[electronicsInstance:electronicsInstance])
			}
			else {
				render(view:'edit',model:[electronicsInstance:electronicsInstance])
			}
		}
		else {
			flash.message = "product not found with id ${params.id}"
			redirect(action:list)
		}
	}

	def save(Electronics electronicsInstance) {
		if (electronicsInstance == null) {
			notFound()
			return
		}

		if (electronicsInstance.hasErrors()) {
			respond electronicsInstance.errors, view:'create'
			return
		}

		// Getting the file
		def f = request.getFile('image')

		// List of OK mime-types
		if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
			flash.message = "File must be one of: ${ProductController.okcontents}"
			respond electronicsInstance.errors, view:'create'
			return
		}
		if (f.size > 0){
			// Save the image and mime type
			electronicsInstance.image = f.bytes
			electronicsInstance.imageType = f.contentType
		}

		electronicsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'electronicsInstance.label', default: 'User'),
					electronicsInstance.id
				])
				redirect electronicsInstance
			}
			'*' { respond electronicsInstance, [status: CREATED] }
		}
	}

	def getImage() {
		def electronics = Electronics.get(params.id)
		if (!electronics || !electronics.image || !electronics.imageType) {
			response.sendError(404)
			return
		}
		response.contentType = electronics.imageType
		response.contentLength = electronics.image.size()
		OutputStream out = response.outputStream
		out.write(electronics.image)
		out.close()
	}

	def scaffold = Electronics
}
