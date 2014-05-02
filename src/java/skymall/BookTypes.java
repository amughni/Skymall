package skymall;

public enum BookTypes {
	
	BOOKS("Books"), TEXTBOOKS("Text Books"), NEWSSTAND("Newsstand");
	final String desc;

	private BookTypes(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return desc;
	}
	
	public static String[]  getTypeNames(){
		String[] typesName = new String[BookTypes.values().length];
		
		int i = 0;
		for (BookTypes b : BookTypes.values()) {
			typesName[i] = b.desc;
			i++;
		}
		
		return typesName;
	}


}
