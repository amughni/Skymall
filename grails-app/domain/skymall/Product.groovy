package skymall

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.builder.HashCodeBuilder
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;


class Product implements Serializable{

	String storeID
	String prodName
	Double price
	String description
	byte[] image;
	String imageType

	List variants = new ArrayList()

	static belongsTo = [Store, Cart]
	static hasMany = [cart: Cart, variants: Variant]

	static constraints = {
		prodName(blank:false, unique:true)
		storeID(blank:false, nullable:false)
		prodName(unique:'storeID')
		image(nullable:true, maxSize: 1049000)
		imageType(nullable:true)
		description(nullable:true)
	}

	static mapping = { variants cascade:"all,delete-orphan" }

	boolean equals(other) {
		if (!(other instanceof Product)) {
			return false
		}
		other.prodName == prodName && other.storeID == storeID
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append prodName
		builder.append storeID
		builder.toHashCode()
	}
}
