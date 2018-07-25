global class LeadProcessor implements Database.Batchable<SObject> {
	
	String query;
	
	global LeadProcessor() {
		
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		query = 'Select Id from Lead';
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<SObject> scope) {
		   List<Lead> ls = (List<Lead>)scope;
		   for(Lead l : ls){
			   l.LeadSource = 'Dreamforce';
		   }
		   update ls;
	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}