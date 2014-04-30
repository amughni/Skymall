package skymall

class ApparelController {

    def index() { }
	
	def newApparel(){
		//render params.id
		flash.storeID = params.id
		render(view: "create")
		//flash.storeID = params.id
		//render(view: "create")
	}
	
	def list(){
		//render params.id
		def apparelList = Apparel.findAllByStoreID(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [apparelInstanceList: apparelList])
	}
	
	def scaffold = Apparel
}
