package skymall;

import java.awt.print.Book;

class CartController {


	def index() {
	}

	/*def add = {
	 String uid = params.userID
	 def cart = customShoppingCartService.getShoppingCart(uid);
	 if(cart == null){
	 cart = customShoppingCartService.createShoppingCart(uid);
	 }
	 //def product = Shoppable.get(flash.prodID)
	 def product = Product.findById(flash.prodID)
	 product.addToShoppingCart()
	 if(params.version) {
	 def version = params.version.toLong()
	 if(product.version > version) {
	 product.errors.rejectValue("version", "shoppable.optimistic.locking.failure", message(code:"Shoppable.already.updated"))
	 } else {
	 product.addToShoppingCart()
	 }
	 } 
	 else {
	 product.addToShoppingCart()
	 }
	 render(template:'shoppingCartContent', plugin:'shoppingCart')
	 }*/

	def addProduct(){
		// user id
		int uid = params.uid as int
		// product id
		int pid = params.pid as int

		// find user
		User user = User.get(uid);
		// find cart by user
		def cart = Cart.findByUser(user)
		// find product
		def product = Product.findById(pid)
		
		def currentController = ""

		if(cart == null){
			cart = new Cart()
			cart.user = user;
		}else{
			boolean found = false;
			//			def d = cart.findAllByProductList(product) ;
			for (Product p : cart.productList ){
				if (p.id == pid){
					found = true;
					break;
				}
			}
			if (found){
				flash.message = "product is already present in cart"
				if ( product instanceof Apparel)
					redirect (controller: "apparel",  action: "show", id: pid)
				else if ( product instanceof Book)
					redirect (controller: "book",  action: "show", id: pid)
				else if ( product instanceof Electronics)
					redirect (controller: "electronics",  action: "show", id: pid)
				else if ( product instanceof Shoe)
					redirect (controller: "shoe",  action: "show", id: pid)

				return;
			}
		}
		cart.addToProductList(product);
		cart.save()
		render(view:'show', model:[cartInstance:cart])
	}

	def deleteProduct(){
		String pid = params.id
		String cartID = flash.cid

		//def productInstance = Product.findById(prodID)

		def cart = Cart.findById(cartID)

		for(product in cart.productList){
			if(product.id == pid){
				cart.productList.remove(product)
			}
		}

		cart.save()
		render(view:'show', model:[cartInstance:cart])
	}


	def scaffold = Cart
}
