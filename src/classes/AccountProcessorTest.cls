@isTest
public class AccountProcessorTest {
	@isTest
    static void countContactTest(){
        Account acc = new Account(Name='tam');
        insert acc;
        Contact con = new Contact(LastName='test con', AccountId=acc.Id,Email='tam@abc.com');
        insert con;
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc.Id});
        Test.stopTest();
    }
}