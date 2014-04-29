package skymall

class Store {
	
	String storeName
	String location	
	String storeType
	
	static constraints = {
		storeName(blank:false, unique: true)
	}
}
