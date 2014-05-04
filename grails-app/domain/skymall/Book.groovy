package skymall

class Book extends Product{

	String author
	String category	
	String isbn
	String subCategory
	String[] subCategories
	
	static transients = [ 'subCategories' ]
	
    static constraints = {
    }
}
