package skymall

import java.util.List;

class Cart implements Serializable{

	List productList = new ArrayList()

	static belongsTo = [user: User]
	static hasMany = [productList: Product]

    static constraints = {
        user unique: true
    }
}