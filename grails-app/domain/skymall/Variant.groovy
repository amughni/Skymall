package skymall

class Variant implements Serializable{

	String name
	String value
	boolean _deleted
	
	static transients = [ '_deleted' ]
	
	static belongsTo = [ product: Product ]
	
    static constraints = {
		_deleted bindable: true
    }
	
	def String toString() {
		return name
	}
}
