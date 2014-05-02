package skymall
import org.apache.commons.lang.builder.HashCodeBuilder
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class BookCategory implements Serializable{
	
	static constraints = {
	}
	
	String name
	String storeID
	List bookSubCategories = new ArrayList() 
	static hasMany = [bookSubCategories: BookSubCategory]
	
	static mapping = {
		id composite: ['name', 'storeID']
		bookSubCategories cascade:"all,delete-orphan"
	}
	
	def getExpandableBookSubCategoryList() {		
		return LazyList.decorate(bookSubCategories, FactoryUtils.instantiateFactory(BookSubCategory.class))		
	}
	
	boolean equals(other) {
		if (!(other instanceof BookCategory)) {
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
