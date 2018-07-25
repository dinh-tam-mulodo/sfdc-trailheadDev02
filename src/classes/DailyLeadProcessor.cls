global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext sc) {
		List<Lead> ls = [Select ID from Lead where LeadSource = '' limit 200];
		for(Lead l : ls){
			l.LeadSource = 'DreamForce';
		}
		update ls;
	}
}