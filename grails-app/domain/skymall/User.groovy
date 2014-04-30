package skymall

class User {

	String userName
	String password
	String userRole
	
    static constraints = {
		userName(blank: false)
		userName(nullable: false)
		
		password(blank: false)
		userName(nullable: false)
    }
	
}
