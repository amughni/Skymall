package skymall

class Product {

	String storeID
	String prodName
	Double price
	String description
	Integer prodCount
	
	static belongsTo = [Store, Cart]
	static hasMany = [cart: Cart]
	
    static constraints = {
		prodName(blank:false, unique:true)
    }
}
