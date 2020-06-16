public with sharing class ViSearchR_APIEndpoint {
    public enum Endpoint {
        GET_VIDEOS
    }
    
    private static Map<Endpoint, String> ENUM_TO_PATH = new Map<Endpoint, String> {
      	Endpoint.GET_VIDEOS => '/youtube/v3/search/'
    };
    
    public static String getEndpointURL(Endpoint endpoint) {
        return ViSearchR_Settings.API_ENDPOINT.removeEnd('/') + ENUM_TO_PATH.get(endpoint);
    }
}