package skymall

class Automobile extends Product{

    String manufacturer
    String warranty

    static constraints = {
        manufacturer(nullable: true)
        warranty(nullable: true)
    }
}
