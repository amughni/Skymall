package skymall

import java.util.Locale.Category;

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
	
	def ajaxGetSubCategory = {
		def subCats = Category.getSubCategoryNames(params.cat);
		render subCats as JSON
	}
	
	@Transactional
	def save(Book bookInstance) {
		if (bookInstance == null) {
			notFound()
			return
		}
		
		if (bookInstance.hasErrors()) {
			respond bookInstance.errors, view:'create'
			return
		}

		bookInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'bookInstance.label', default: 'User'), bookInstance.id])
				redirect bookInstance
			}
			'*' { respond bookInstance, [status: CREATED] }
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

	
    def index() { }
	
	def scaffold = Book
}
