public class AnimalLocator {
	
	public static String getAnimalNameById(Integer id){
		String name = '';
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           Map<String,Object> animal = (Map<String,Object>) results.get('animal'); 
		   name= (String)animal.get('name');
        }
        return name;
	}
}