package skymall

class Store {

	String storeID
	String storeName
	String location
	
    static constraints = {
		storeID(blank:false, unique: true)
    }
}
