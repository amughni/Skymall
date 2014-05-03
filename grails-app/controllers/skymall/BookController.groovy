package skymall

class BookController {

	def list(){
		//render params.id
		def bookList = Book.findAllByStoreID(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [bookInstanceList: bookList])
	}
	
    def index() { }
	
	def scaffold = Book
}
