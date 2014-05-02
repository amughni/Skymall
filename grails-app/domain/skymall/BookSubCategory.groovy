package skymall

class BookSubCategory {
	
	static constraints = {
	}
	
	String name;
	boolean _deleted
	
	static transients = [ '_deleted' ]
	
	static belongsTo = [ bookCategory: BookCategory ]
	
	def String toString() {
		return name
	}
}
