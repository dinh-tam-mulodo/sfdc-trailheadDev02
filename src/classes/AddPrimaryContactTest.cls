@isTest
private class AddPrimaryContactTest
{
	@TestSetup
	static void  setup(){
		List<Account> accs = new List<Account>();
		for(Integer i=0;i<100;i++){
			String state = i >= 50 ? 'CA' : 'NY';
			Account acc = new Account(Name='test',BillingState=state);
			accs.add(acc);
		}
		insert accs;
	}
	@isTest
	static void itShould()
	{
		Contact con = new Contact(LastName='LastName');
		insert con;
		Test.startTest();
		AddPrimaryContact q = new AddPrimaryContact(con,'CA');
		System.enqueueJob(q);
		Test.stopTest();
		List<Contact> cons = [Select Id from Contact where AccountId != ''];
		system.assert(cons.size()==50);
	}
}