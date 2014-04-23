package skymall

class ProductController {

    def scaffold = Product
	
	def list(){
		def prodList = Product.findAllByStoreID(params.id)
		//System.out.println "store ID" + params.id
		render(view:"list", model: [productInstanceList: prodList])		
	}
	
	def show(){
		def product = Product.findByProdID(params.prodID)
		render(view:"productDetails", model: [productInstance: product])
	}
}
