public with sharing class ViSearchR_APIClient {
	private static final Map<String, ViSearchR_APIClient> INSTANCES = new Map<String, ViSearchR_APIClient>();
    public Id userId { get; private set; }
    private static final Integer API_TIMEOUT = 30000;
    
    private ViSearchR_APIClient(Id userId) {
        this.userId = userId;
    }
    
    public static ViSearchR_APIClient getClient() {
        return getClient(ViSearchR_Settings.USER_ID);
    }
    
    public static ViSearchR_APIClient getClient(Id userId) {
        String key = (String.isBlank(userId)) ? 'NULL_KEY' : userId;
        if(!INSTANCES.containsKey(key)) {
            INSTANCES.put(key, new ViSearchR_APIClient(userId));
        }       
        ViSearchR_APIClient client = INSTANCES.get(key);
        return client;
    }
    
    public String request(ViSearchR_APIEndpoint.Endpoint endpoint, String body, String requestMethod, String endpointParams) {
        try {
            HttpRequest req = new HttpRequest();
            String endpointURL = ViSearchR_APIEndpoint.getEndpointURL(endpoint);
            if(endpointParams != null) {
                endpointURL = endpointURL + endpointParams;
            }   
            req.setEndpoint(endpointURL);
            req.setMethod(requestMethod);
            req.setHeader('Accept', 'application/json');
            req.setHeader('Content-Type', 'application/json');
            req.setTimeout(API_TIMEOUT);
            if(body != null) {
                req.setBody(body);
            }
            HttpResponse resp = doSend(req);
            return resp.getBody();
        } catch(Exception e) {
            throw e;
        }
    }
    
    private HttpResponse doSend(HttpRequest req) {
        Http http = new Http();
        HttpResponse resp = http.send(req);
        Integer statusCode = resp.getStatusCode();
        if(statusCode != 200) {
			System.debug('Exception in here!');
        }
        return resp;
    }
    
    //Custom Exception
}