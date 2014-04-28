package skymall

class Cart {
	
	static belongsTo = [User]
	static hasMany = [product: Product]
	
	User owner
	String status
	

    static constraints = {
    }
}
