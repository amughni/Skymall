package skymall

import java.util.List;

class Cart implements Serializable{
	
	String userID
	Store storeID
	List productList = new ArrayList()
	
	static belongsTo = [user: User, store: Store]
	static hasMany = [productList: Product]
	
	static mapping = {
		id composite: ['userID', 'storeID']
	}
	
    static constraints = {
    }
}
