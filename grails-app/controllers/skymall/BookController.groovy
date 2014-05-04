package skymall


import grails.converters.JSON
import grails.transaction.Transactional;

class BookController {

	def list(){
		//render params.id
		def bookList = Book.findAllByStoreID(params.id)
		flash.storeID = params.id

		render(view:"index", model: [bookInstanceList: bookList])
	}

	def  create(){
		def storeid = flash.storeID
		respond new Book(storeID:storeid);
	}
	
	def edit(){
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

	@Transactional
	def save(Book bookInstance) {
		if (bookInstance == null) {
			notFound()
			return
		}

		if (bookInstance.hasErrors()) {
			book.subCategories = Category.getSubCategoryNames(bookInstance.category);
			respond bookInstance.errors, view:'create'
			return
		}

		def _toBeDeleted = bookInstance.variants.findAll {it._deleted}
		if (_toBeDeleted) {
			bookInstance.variants.removeAll(_toBeDeleted)
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
