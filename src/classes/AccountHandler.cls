public with sharing class AccountHandler {
	public static Account insertNewAccount(String acctName) {
		Account newAcct = new Account(Name=acctName);

		try {
			insert newAcct;
		} catch (DmlException ex) {
			newAcct.addError('Error: ' + ex.getMessage());
			return null;
		}

		return newAcct;
	}
}