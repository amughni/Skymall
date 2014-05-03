package skymall;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum Category {

	FICTION("Fiction & Literature", new String[] {
			"Fiction Books & Literature", "Graphic Novels", "Horror",
			"Mystery & Crime", "Poetry", "Romance Books",
			"Science Fiction & Fantasy", "Thrillers", "Westerns" }), CHILDREN(
			"Children", new String[] { "Ages 0-2", "Ages 3-5", "Ages 6-8",
					"Ages 9-12", "Teens" }), NONFICTION("NonFiction",
			new String[] { "African Americans", "Antiques & Collectibles",
					"Art, Architecture & Photography",
					"Bibles & Bible Studies", "Biography", "Business Books",
					"Christianity", "Computer & Technology Books",
					"Cookbooks, Food & Wine" }),

	NEWS("News & Noteworthy", new String[] { "Bestsellers", "Coming Soon",
			"New Releases", "NY Times Bestsellers", "Award Winners",
			"Discover Great New Writers", "Recommended",
			"Daily Top Ten Books By Subject" }),

	BOOKDEALS("Book Deals", new String[] { "Bargain Books", "Deal of the Day" }),

	SPECIALFORMATS("Special Formats", new String[] { "Audiobooks", "Calendars",
			"MP3 Audio Books", "Large Print", "Paperback" }),

	SPECIALCOLLECTIONS("Special Collections", new String[] {
			"Collectible Editions", "Signed Books" }),

	AUTHOR_RECOMMENDATION("Author Recommendations", new String[] {
			"Gillian Flynn", "Khaled Hosseini", "Michael Pollan",
			"Janet Evanovich", "Robert Caro", "J.R. Ward", "Karen Kingsbury",
			"Junot Diaz" });

	final String desc;

	List<String> subCats = new ArrayList<String>();

	private Category(String desc, String[] subCats) {
		this.desc = desc;
		this.subCats = Arrays.asList(subCats);
	}

	private Category(String desc) {
		this.desc = desc;
	}

	public List<String> getSubCategory(String cat) {
		return this.subCats;
	}

	@Override
	public String toString() {
		return desc;
	}

	/*
	 * public static enum SubCategory { FICTION("B"), CHILDREN("Electronics"),
	 * AUTOMOBILE("Automobile"), BOOKS( "Books"); final String desc;
	 * 
	 * private SubCategory(String desc) { this.desc = desc; }
	 * 
	 * @Override public String toString() { return desc; } }
	 */

	public static String[] getCategoryNames() {
		String[] typesName = new String[Category.values().length];

		int i = 0;
		for (Category c : Category.values()) {
			typesName[i] = c.desc;
			i++;
		}

		return typesName;
	}

	public static String[] getSubCategoryNames(String cat) {
		String[] subCatList = new String[] {};
		if (cat != null) {
			for (Category c : Category.values()) {
				if (c.desc.equals(cat)) {
					subCatList = (String[]) c.subCats.toArray();
					break;
				}
			}
		}
		return subCatList;
	}

}
