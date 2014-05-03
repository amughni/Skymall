package skymall

class ProductController {

    def scaffold = Product
	
	def list(){
		//render "Inside Product List"
		//render params.id
		def store = Store.findById(params.id)
		flash.storeID = params.id
		def storeType = store.storeType;
		
		if(storeType == "Apparel"){
			redirect(controller: 'Apparel', action: 'list', params: [storeID: params.id])
		}
		else if(storeType == "Electronics"){
			redirect(controller: 'Electronics', action: 'list')
		}
		else if(storeType == "Automobile"){
			redirect(controller: 'Automobile', action: 'list')
		}
		
		//def prodList = Product.findAllByStoreID(params.id)
		//render(view: "list")
		//System.out.println "store ID" + params.id
		//render(view:"index", model: [productInstanceList: prodList, id: params.id])		
	}
	
	def show(){
		def product = Product.findByProdID(params.prodID)
		render(view:"productDetails", model: [productInstance: product])
	}
	
	def create(){
		render "Inside Product Create"
		//render params.id
		/*def store = Store.findById(params.id)
		
		if(store.storeType == "Apparel"){
			//render(view: "/apparel/create", model: [storeID: params.id])
			
			redirect(controller: 'Apparel', action: 'newApparel', params: [storeID: params.id])
		}*/
	}
	
	def update = {
		def productInstance = Product.get( params.id )
		if(productInstance) {
			if(params.version) {
				// ... version locking stuff
			}

			productInstance.properties = params
			def _toBeDeleted = productInstance.variants.findAll {
				it._deleted
			}
			
			if (_toBeDeleted) {
				productInstance.variants.removeAll(_toBeDeleted)
			}
		}
	}
}
