package skymall

class Shoe extends Product{

	String size
	String color
	String category
	String[] style
	
	static transients = [ 'style' ]
	
    static constraints = {
    }
}
