package skymall

class Variant implements Serializable{

	String name
	String value
	boolean _deleted
	
	static transients = [ '_deleted' ]
	
	static belongsTo = [ product: Product ]
	
    static constraints = {
    }
	
	def String toString() {
		return name
	}
}
