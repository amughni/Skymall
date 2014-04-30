package skymall;

public enum UserRole {

	TENANT("Tenant"), SHOPPER("Shopper");
	final String desc;

	private UserRole(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return desc;
	}
	
	public static String[]  getuserRole(){
		String[] roleName = new String[UserRole.values().length];
		
		int i = 0;
		for (UserRole s : UserRole.values()) {
			roleName[i] = s.desc;
			i++;
		}
		
		return roleName;
	}
}
