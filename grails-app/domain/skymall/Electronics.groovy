package skymall

import java.util.List;

class Electronics extends Product{

	List specList = new ArrayList()
	
	static hasMany = [specList: Specification]
	
	static mapping = {
		specList cascade:"all,delete-orphan"
	}	
	
    static constraints = {
    }	
	
}
