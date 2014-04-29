package skymall

class ApparelController {

    def index() { }
	
	def newApparel(){
		render params.storeID
		//render(view: "create", model: [storeID: params.storeID])
		//flash.storeID = params.storeID
		//render(view: "create")
	}
	
	def list(){
		//render params.storeID
		def apparelList = Apparel.findAllByStoreID(params.storeID)
		flash.storeID = params.storeID
		
		//render apparelList.size()		
		//render apparel.prodName
		render(view:"index", model: [apparelInstanceList: apparelList, id: params.storeID])	
	}
	
	def scaffold = Apparel
}
