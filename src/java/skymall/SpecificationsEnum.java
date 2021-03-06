package skymall;

public enum SpecificationsEnum {

	WARRANTY_PARTS("Warranty Terms - Parts"), WARRANTY_lABOR(
			"Warranty Terms - Labor"), WIDTH("Width"), WEIGHT("Weight"), TYPE(
			"Type"), SCREEN_SIZE("Screen Size");

	final String desc;

	private SpecificationsEnum(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return desc;
	}

	public static String[] getTypeNames() {
		String[] typesName = new String[StoreTypes.values().length];

		int i = 0;
		for (StoreTypes s : StoreTypes.values()) {
			typesName[i] = s.desc;
			i++;
		}

		return typesName;
	}

}
