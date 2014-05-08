package skymall


import grails.converters.JSON
import grails.transaction.Transactional;
import skymall.Category;

class BookController {

	def list(){
		//render params.id
		def bookList = Book.findAllByStoreID(params.id)
		flash.storeID = params.id

		render(view:"index", model: [bookInstanceList: bookList])
	}

	def  create(){
		if(session.user.userRole != "Tenant") {
			flash.error = message(code: 'default.not.authorized')
			redirect(action: "list")
			return
		}

		def storeid = flash.storeID
		respond new Book(storeID:storeid);
	}

	def edit(){
		if(session.user.userRole != "Tenant") {
			flash.error = message(code: 'default.not.authorized')
			redirect(action: "list")
			return
		}
		
		def book = Book.get(params.id)
		book.subCategories = Category.getSubCategoryNames(book.category);
		respond book
	}


	def ajaxGetSubCategory = {
		def a = params.cat
		String[] subCats = Category.getSubCategoryNames(a);
		def result = "-Choose a subcategory"
		subCats.each { result += "," + it  }
		render result
	}

	def update()  {
		def bookInstance = Book.get( params.id )
		if(bookInstance) {
			if(params.version) {
				def version = params.version.toLong()
				if(bookInstance.version > version) {
					bookInstance.errors.rejectValue("version", "", "Another user has updated this product while you were editing.")
					render(view:'edit',model:[bookInstance:bookInstance])
					return
				}
			}

			// Getting the file
			def f = request.getFile('image')

			// List of OK mime-types
			if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
				flash.message = "File must be one of: ${ProductController.okcontents}"
				respond bookInstance.errors, view:'create'
				return
			}

			if (f.size > 0){
				// Save the image and mime type
				bookInstance.image = f.bytes
				bookInstance.imageType = f.contentType
			}

			bookInstance.properties = params
			def _toBeDeleted = bookInstance.variants.findAll {it._deleted}
			if (_toBeDeleted) {
				bookInstance.variants.removeAll(_toBeDeleted)
			}

			if(!bookInstance.hasErrors() && bookInstance.save()) {
				flash.message = "Electronic Item ${params.id} updated"
				render(view:'show',model:[bookInstance:bookInstance])
			}
			else {
				bookInstance.subCategories = Category.getSubCategoryNames(bookInstance.category);
				render(view:'edit',model:[bookInstance:bookInstance])
			}
		}
		else {
			flash.message = "product not found with id ${params.id}"
			redirect(action:list)
		}
	}

	def save(Book bookInstance) {
		if (bookInstance == null) {
			notFound()
			return
		}

		if (bookInstance.hasErrors()) {
			bookInstance.subCategories = Category.getSubCategoryNames(bookInstance.category);
			respond bookInstance.errors, view:'create'
			return
		}

		// Getting the file
		def f = request.getFile('image')

		// List of OK mime-types
		if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
			flash.message = "File must be one of: ${ProductController.okcontents}"
			respond bookInstance.errors, view:'create'
			return
		}
		if (f.size > 0){
			// Save the image and mime type
			bookInstance.image = f.bytes
			bookInstance.imageType = f.contentType
		}

		bookInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'bookInstance.label', default: 'User'),
					bookInstance.id
				])
				redirect bookInstance
			}
			'*' { respond bookInstance, [status: CREATED] }
		}
	}


	def getImage() {
		def book = Book.get(params.id)
		if (!book || !book.image || !book.imageType) {
			response.sendError(404)
			return
		}
		response.contentType = book.imageType
		response.contentLength = book.image.size()
		OutputStream out = response.outputStream
		out.write(book.image)
		out.close()
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'userInstance.label', default: 'User'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}


	def index() {
	}

	def scaffold = Book
}
