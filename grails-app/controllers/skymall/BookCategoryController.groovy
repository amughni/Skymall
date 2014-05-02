package skymall

class BookCategoryController {

    def index() { 
		flash.storeID = params.id
		respond BookCategory.list()
	}
	
	def  create(){
		def storeid = params.id
		respond new BookCategory(storeID:storeid);
	}
	
	def update = {
		def bookCategoryInstance = BookCategory.get( params.id )
		if(bookCategoryInstance) {
			if(params.version) {
				// ... version locking stuff
			}

			bookCategoryInstance.properties = params
			def _toBeDeleted = bookCategoryInstance.bookSubCategories.findAll {
				it._deleted
			}
			
			if (_toBeDeleted) {
				bookCategoryInstance.bookSubCategories.removeAll(_toBeDeleted)
			}
		}
	}
		
	def scaffold = BookCategory
	
	
	/*def create(){
		
		render(view: 'create', model:[subCatList: subCategories])
	}
	
	def save(){
		
	}*/
}
