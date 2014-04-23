package skymall

class Product {

	String prodID
	String storeID
	String prodName
	Double price
	String description
	Integer count
	
	static belongsTo = [Store, Cart]
	static hasMany = [cart: Cart]
	
    static constraints = {
		prodID(blank:false, unique:true)
    }
}
