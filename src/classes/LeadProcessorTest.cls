@isTest
private class LeadProcessorTest
{
	@isTest
	static void itShould()
	{
		List<Lead> ls = new List<Lead>();
		for(Integer i = 0;i<200;i++){
			Lead l = new Lead(LastName='New-'+(i+1),Company='NoCompany');
			ls.add(l);
		}
		insert ls;

		Test.startTest();
		LeadProcessor b = new LeadProcessor();
		Database.executeBatch(b);
		Test.stopTest();
	}
}