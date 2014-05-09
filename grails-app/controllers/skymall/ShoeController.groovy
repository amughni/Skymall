package skymall



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ShoeController {


	def list(){
		//render params.id
		def shoeList = Shoe.findAllByStoreID(params.id)
		flash.storeID = params.id

		render(view:"index", model: [shoeInstanceList: shoeList])
	}

	def  create(){
		if(session.user.userRole != "Tenant") {
			flash.error = message(code: 'default.not.authorized')
			redirect(action: "list")
			return
		}

		def storeid = flash.storeID
		respond new Shoe(storeID:storeid);
	}

	def edit(){
		if(session.user.userRole != "Tenant") {
			flash.error = message(code: 'default.not.authorized')
			redirect(action: "list")
			return
		}
		
		def shoe = Shoe.get(params.id)
		shoe.style = ShoeCategory.getStyleNames(shoe.category);
		respond shoe
	}
	
	def ajaxGetStyle = {
		def a = params.cat
		String[] style = ShoeCategory.getStyleNames(a);
		def result = "-Choose a style"
		style.each { result += "," + it  }
		render result
	}
	
	
	def update()  {
		def shoeInstance = Shoe.get( params.id )
		if(shoeInstance) {
			if(params.version) {
				def version = params.version.toLong()
				if(shoeInstance.version > version) {
					shoeInstance.errors.rejectValue("version", "", "Another user has updated this product while you were editing.")
					render(view:'edit',model:[shoeInstance:shoeInstance])
					return
				}
			}

			// Getting the file
			def f = request.getFile('image')

			// List of OK mime-types
			if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
				flash.message = "File must be one of: ${ProductController.okcontents}"
				respond shoeInstance.errors, view:'create'
				return
			}

			if (f.size > 0){
				// Save the image and mime type
				shoeInstance.image = f.bytes
				shoeInstance.imageType = f.contentType
			}

			shoeInstance.properties = params
			def _toBeDeleted = shoeInstance.variants.findAll {it._deleted}
			if (_toBeDeleted) {
				shoeInstance.variants.removeAll(_toBeDeleted)
			}

			if(!shoeInstance.hasErrors() && shoeInstance.save()) {
				flash.message = "Shoe Item ${params.id} updated"
				render(view:'show',model:[shoeInstance:shoeInstance])
			}
			else {
				shoeInstance.style = ShoeCategory.getStyleNames();
				render(view:'edit',model:[shoeInstance:shoeInstance])
			}
		}
		else {
			flash.message = "product not found with id ${params.id}"
			redirect(action:list)
		}
	}


	def getImage() {
		def shoe = Shoe.get(params.id)
		if (!shoe || !shoe.image || !shoe.imageType) {
			response.sendError(404)
			return
		}
		response.contentType = shoe.imageType
		response.contentLength = shoe.image.size()
		OutputStream out = response.outputStream
		out.write(shoe.image)
		out.close()
	}

	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Shoe.list(params), model:[shoeInstanceCount: Shoe.count()]
    }

    def show(Shoe shoeInstance) {
        respond shoeInstance
    }


    @Transactional
    def save(Shoe shoeInstance) {
		if (shoeInstance == null) {
			notFound()
			return
		}

		if (shoeInstance.hasErrors()) {
			shoeInstance.style = ShoeCategory.getStyleNames(shoeInstance.category);
			respond shoeInstance.errors, view:'create'
			return
		}

		// Getting the file
		def f = request.getFile('image')

		// List of OK mime-types
		if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
			flash.message = "File must be one of: ${ProductController.okcontents}"
			respond shoeInstance.errors, view:'create'
			return
		}
		if (f.size > 0){
			// Save the image and mime type
			shoeInstance.image = f.bytes
			shoeInstance.imageType = f.contentType
		}

		shoeInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'shoeInstance.label', default: 'User'),
					shoeInstance.id
				])
				redirect shoeInstance
			}
			'*' { respond shoeInstance, [status: CREATED] }
		}
	}

    /* @Transactional
    def update(Shoe shoeInstance) {
        if (shoeInstance == null) {
            notFound()
            return
        }

        if (shoeInstance.hasErrors()) {
            respond shoeInstance.errors, view:'edit'
            return
        }

        shoeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Shoe.label', default: 'Shoe'), shoeInstance.id])
                redirect shoeInstance
            }
            '*'{ respond shoeInstance, [status: OK] }
        }
    }
*/
   				
 @Transactional
    def delete(Shoe shoeInstance) {

        if (shoeInstance == null) {
            notFound()
            return
        }

        shoeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Shoe.label', default: 'Shoe'), shoeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shoeInstance.label', default: 'Shoe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
