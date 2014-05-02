package skymall

class ElectronicsController {

	def scaffold = Electronics
	
	def newApparel(){
		//render params.id
		flash.storeID = params.id
		render(view: "create")
		//flash.storeID = params.id
		//render(view: "create")
	}
	
	def list(){
		//render params.id		
		def electronicProdList = Electronics.findByStoreId(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [electronicsInstanceList: electronicProdList])
	}
	
	
    def index() { }
}
