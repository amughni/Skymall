package skymall

class Specification {

	String name
	String details
	String description
	
	static mapping = {
		id composite: ['name', 'storeID']		
	}
	
    static constraints = {
    }
	
	boolean equals(other) {
		if (!(other instanceof E)) {
			return false
		}

		other.name == name && other.storeID == storeID
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append name
		builder.append storeID
		builder.toHashCode()
	}
}
