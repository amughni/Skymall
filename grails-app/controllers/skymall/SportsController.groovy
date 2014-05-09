package skymall
import grails.transaction.Transactional;

class SportsController {

	def index() {
	}

	def list(){
		//render params.id
		def sportsInstanceList = Sports.findAllByStoreID(params.id)
		flash.storeID = params.id
		render(view:"index", model: [sportsInstanceList: sportsInstanceList])
	}

	
	def  create(){
		def storeid = flash.storeID
		respond new Sports(storeID:storeid);
	} 

	def update()  {
		def sportsInstance = Sports.get( params.id )
		if(sportsInstance) {
			if(params.version) {
				def version = params.version.toLong()
				if(sportsInstance.version > version) {
					sportsInstance.errors.rejectValue("version", "", "Another user has updated this product while you were editing.")
					render(view:'edit',model:[sportsInstance:sportsInstance])
					return
				}
			}

	
			// Getting the file
//			def f = request.getFile('image')
//
//			// List of OK mime-types
//			if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
//				flash.message = "File must be one of: ${ProductController.okcontents}"
//				respond sportsInstance.errors, view:'create'
//				return
//			}
//			if (f.size >= 0){
//				// Save the image and mime type
//				sportsInstance.image = f.bytes
//				sportsInstance.imageType = f.contentType
//			}

			sportsInstance.properties = params
			def _toBeDeleted = sportsInstance.variants.findAll {it._deleted}
			if (_toBeDeleted) {
				sportsInstance.variants.removeAll(_toBeDeleted)
			}

			if(!sportsInstance.hasErrors() && sportsInstance.save()) {
				flash.message = "Sports ${params.id} updated"
				render (view:'show',model:[sportsInstance:sportsInstance])
			}
			else {
				render(view:'edit',model:[sportsInstance:sportsInstance])
			}
		}
		else {
			flash.message = "product not found with id ${params.id}"
			redirect(action:list)
		}
	}

	
	
	
	def save(Sports sportsInstance) {
		if (sportsInstance == null) {
			notFound()
			return
		}

		if (sportsInstance.hasErrors()) {
			respond sportsInstance.errors, view:'create'
			return
		}

//		// Getting the file
//		def f = request.getFile('image')
//
//		// List of OK mime-types
//		if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
//			flash.message = "File must be one of: ${ProductController.okcontents}"
//			respond sportsInstance.errors, view:'create'
//			return
//		}
//		if (f.size >= 0){
//			// Save the image and mime type
//			sportsInstance.image = f.bytes
//			sportsInstance.imageType = f.contentType
//		}

		sportsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'sportsInstance.label', default: 'User'),
					sportsInstance.id
				])
				redirect sportsInstance
			}
			'*' { respond sportsInstance, [status: CREATED] }
		}
	}
//	def getImage() {
//		def sports = Sports.get(params.id)
//		if (!sports || !sports.image || !sports.imageType) {
//			response.sendError(404)
//			return
//		}
//		response.contentType = sports.imageType
//		response.contentLength = sports.image.size()
//		OutputStream out = response.outputStream
//		out.write(sports.image)
//		out.close()
//		
//		
//	}

	def scaffold = Sports

	
	
}
