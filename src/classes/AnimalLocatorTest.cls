@isTest
private class AnimalLocatorTest
{
	@isTest
	static void itShould()
	{
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
		String res = AnimalLocator.getAnimalNameById(1);
		system.assert(!String.isBlank(res));
		Test.stopTest();
	}
}