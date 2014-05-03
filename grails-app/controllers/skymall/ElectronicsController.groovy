package skymall

class ElectronicsController {

    def index() { }
	
	def list(){
		//render params.id
		def electronicsList = Electronics.findAllByStoreID(params.id)
		flash.storeID = params.id
		
		render(view:"index", model: [electronicsInstanceList: electronicsList])
	}
	
	def  create(){
		//def storeid = params.id
		def storeid = flash.storeID
		respond new Electronics(storeID:storeid);
	}
}
