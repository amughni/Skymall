
public class StoreDetails {

	String storeID = null;
	public String getStoreID() {
		return storeID;
	}

	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	String storeName = null;
	String location = null;
	
	public StoreDetails(String storeID) {
		
		this.storeID = storeID;		
	}
}
