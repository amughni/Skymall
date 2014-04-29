package skymall;

public enum StoreTypes {

	APPAREL("Apparel"), ELECTRONICS("Electronics"), AUTOMOBILE("Automobile");
	final String desc;

	private StoreTypes(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return desc;
	}
	
	public static String[]  getTypeNames(){
		String[] typesName = new String[StoreTypes.values().length];
		
		int i = 0;
		for (StoreTypes s : StoreTypes.values()) {
			typesName[i] = s.desc;
			i++;
		}
		
		return typesName;
	}
}
