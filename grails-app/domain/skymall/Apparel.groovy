package skymall

class Apparel extends Product{

	String apparelSize
	String color

	static constraints = {
		apparelSize(nullable: true)
		color(nullable: true)
	}
}
