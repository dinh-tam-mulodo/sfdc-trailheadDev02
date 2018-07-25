@isTest
private class DailyLeadProcessorTest
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
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            '0 0 12 * * ?', 
            new DailyLeadProcessor()); 
		Test.stopTest();
	}
}