package skymall

class ApparelController {

    def index() { }
	
	def list(){
		//render params.id
		def apparelList = Apparel.findAllByStoreID(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [apparelInstanceList: apparelList])
	}
	
	def scaffold = Apparel
}
