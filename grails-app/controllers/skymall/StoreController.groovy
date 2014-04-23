package skymall

import groovyx.net.*

class StoreController {

//	String storeID = "st1"
//	
//    def index() { 
//		
//		if(request.method == "GET"){
//			
//			def store = Store.findByStoreID(storeID)
//			if(store)
//			{
//				System.out.println("Store ID: " +storeID);
//			}
//			
//			def prodList = Product.findByStoreID(storeID);
//			
//			/*if(prodList != null){			
//				render([products: prodList])
//			}
//			else{
//				render(view: "index")
//			}*/
//			
//			flash.products = prodList
//			
//			//session.store = store
//			//render(view: "index")
//		}
//	}
	
	def list(Integer max) {
		
		params.max = Math.min(max ?: 10, 100)

		//[storeInstanceList: Store.list(params), storeInstanceTotal: Store.count()]
		
		render(view:"list", model: [storeInstanceList: Store.list(params)])

	}
	
	def scaffold = Store
}