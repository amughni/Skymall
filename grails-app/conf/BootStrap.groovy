import skymall.User


class BootStrap {

    def init = { servletContext ->
		
		def tenant = new User(userName:"gap",
			password:"gap",
			userRole:"Tenant")
		tenant.save()

		def cust = new User(userName:"shop",
			password:"shop",
			userRole:"Shopper")
		cust.save()
		
    }
    def destroy = {
    }
}
