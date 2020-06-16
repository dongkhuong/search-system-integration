public with sharing class ViSearchR_SearchController {
    private static final String googleApiKey = String.isNotBlank(ViSearchR_Settings.API_KEYS) ? ViSearchR_Settings.API_KEYS : '';
    private static final Integer maxResults = 10;
    private static String type = 'video';
    private static String part = 'snippet';
    @AuraEnabled(cacheable=true)
    public static String getDataBySearching(String searchKey, String objectName, String recordId) {
        try{
            return search(searchKey, objectName, recordId);
        } catch(Exception e) {
            throw e;
        }
    }
    public static String search(String searchKey, String objectName, String recordId) {
        ViSearchR_APIClient client = ViSearchR_APIClient.getClient();
        if(String.isBlank(googleApiKey)) {
            System.debug('Exception in here!');
        }
        String commonParams = '?part=' + part + '&maxResults=' + maxResults + '&type=' + type + '&key=' + googleApiKey;
        String searchParams = commonParams + '&q=' + EncodingUtil.urlEncode(searchKey, 'UTF-8');
       	String rawData = client.request(ViSearchR_APIEndpoint.Endpoint.GET_VIDEOS, null, 'GET', searchParams);
        rawData = rawData.replace('"default":', '"normal":');
       	ViSearchR_Objects.Video videoResponseList = (ViSearchR_Objects.Video) JSON.deserialize(rawData, ViSearchR_Objects.Video.class);
        return JSON.serialize(videoResponseList);
    }
}