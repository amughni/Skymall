/**
 * 
 */
package skymall;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum ShoeCategory {

	MEN("Men", new String[] {"Casual Shoes", "Dress Shoes", "Athletic Shoes", "Sneakers", "Loafers", "Boots", "Sandals"}), 
	WOMEN("Women", new String[] {"Dress Shoes", "Casual Shoes", "Athletic Shoes", "Heels", "Boots", "Flats", "Wedges", "Sandals"}), 
	GIRLS("Gilrs",new String[] {"Boots", "Sneakers", "Flats", "Sandals", "Slippers", "Infants", "Toddlers"}),
	BOYS("Boys", new String[] {"Boots", "Sneakers", "Oxfords", "Sandals", "Slippers", "Infants", "Toddlers"});

	
	final String desc;

	List<String> style = new ArrayList<String>();

	private ShoeCategory(String desc, String[] style) {
		this.desc = desc;
		this.style = Arrays.asList(style);
	}

	private ShoeCategory(String desc) {
		this.desc = desc;
	}

	public List<String> getStyle(String cat) {
		return this.style;
	}

	@Override
	public String toString() {
		return desc;
	}


	public static String[] getShoeCategoryNames() {
		String[] typesName = new String[ShoeCategory.values().length];

		int i = 0;
		for (ShoeCategory c : ShoeCategory.values()) {
			typesName[i] = c.desc;
			i++;
		}

		return typesName;
	}

	public static String[] getStyleNames(String cat) {
		String[] styleList = new String[] {};
		if (cat != null) {
			for (ShoeCategory c : ShoeCategory.values()) {
				if (c.desc.equals(cat)) {
					styleList = (String[]) c.style.toArray();
					break;
				}
			}
		}
		return styleList;
	}

}
