public class AddPrimaryContact implements Queueable {
	private Contact contact;
	Private String state;
	public AddPrimaryContact(Contact con, String state){
		this.contact = con;
		this.state = state;
	}
	
	public void execute(QueueableContext context) {
		List<Account> accounts = [select id from account where billingstate =:state];
		List<Contact> cons = new List<Contact>();
		for(Account acc : accounts){
			Contact newCon = contact.clone();
			newCon.AccountId = acc.Id;
			cons.add(newCon);
		}
		insert cons;
	}
}