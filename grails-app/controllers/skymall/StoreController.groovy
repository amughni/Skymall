package skymall

class StoreController {

    def index() { 
		render(view:"index", model: [storeInstanceList: Store.list(params)])
	}
	
	
	def scaffold = Store
}
