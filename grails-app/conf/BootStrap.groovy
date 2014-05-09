import skymall.Store
import skymall.User


class BootStrap {

    def init = { servletContext ->
		
		def tenant = new User(userName:"tenant",
			password:"tenant",
			userRole:"Tenant")
		tenant.save()

		def cust = new User(userName:"shop",
			password:"shop",
			userRole:"Shopper")
		cust.save()
		

	
		def gap = new Store(storeName: "Gap",
							storeType: "Apparel",
							addressLine: "120 N First Street",
							city	: "San Jose",
							state	: "California",
							zip		: "94087",
							country	: "usa",
							userName : "tenant")
		
		def bestbuy = new Store(storeName: "Best Buy",
			storeType: "Electronics",
			addressLine: "130 N First Street",
			city	: "San Jose",
			state	: "California",
			zip		: "94086",
			country	: "usa",
			userName : "tenant")
		
		def pepboys = new Store(storeName: "Pep Boys",
			storeType: "Automobile",
			addressLine: "140 N First Street",
			city	: "San Jose",
			state	: "California",
			zip		: "94083",
			country	: "usa",
			userName : "tenant")
		
		def bn = new Store(storeName: "Barnes & Noble",
			storeType: "Books",
			addressLine: "110 N First Street",
			city	: "San Jose",
			state	: "California",
			zip		: "94082",
			country	: "usa",
			userName : "tenant")
		
		def zappos = new Store(storeName: "Zappos",
			storeType: "Shoes",
			addressLine: "130 N First Street",
			city	: "San Jose",
			state	: "California",
			zip		: "94086",
			country	: "usa",
			userName : "tenant")
		
		
		def SportsAuthority = new Store(storeName: "SportsAuthority",
			storeType: "Sports",
			addressLine: "1st miller street",
			city	: "San Jose",
			state	: "California",
			zip		: "95110",
			country	: "USA",
			userName : "tenant")
		gap.save()
		bestbuy.save()
		pepboys.save()
		bn.save()
		zappos.save()
		
		SportsAuthority.save()
		
    }
    def destroy = {
    }
}
