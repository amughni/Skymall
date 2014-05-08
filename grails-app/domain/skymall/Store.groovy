package skymall

import org.grails.plugins.address.Address

class Store {
	
	String storeName
	String storeType
	String addressLine
	String city
	String state
	String zip
	String country
	
	String userName
	
	
	static constraints = {
		storeName(blank:false, unique: true)
	}
}
