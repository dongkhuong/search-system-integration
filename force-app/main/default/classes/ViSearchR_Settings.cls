public with sharing class ViSearchR_Settings {
	public static final String API_ENDPOINT;
    public static final String API_KEYS;
    public static final Id USER_ID;
    public static final ViSearchR_Settings__c SETTINGS;
    static {
        try {
            Id profileId = UserInfo.getProfileId();
            ViSearchR_Settings__c setting = ViSearchR_Settings__c.getInstance(profileId);
            
            if(setting.Id == null) {
                setting = ViSearchR_Settings__c.getOrgDefaults();
            }
            
            if(setting.Id == null) {
                throw new ViSearchR_SettingsException('Missing Oauth settings.');
            }
            
            USER_ID = UserInfo.getUserId();
            SETTINGS = setting;
            
            if(setting.API_Base_URL__c != null){
                API_ENDPOINT = setting.API_Base_URL__c.removeEnd('/');
            }
            
            if(setting.API_Keys__c != null){
                API_KEYS = setting.API_Keys__c;
            }
        } catch(Exception e) {
            throw new ViSearchR_SettingsException('Unabled to initialize Oauth Settings: ' + e.getMessage());
        }
    }
    public class ViSearchR_SettingsException extends Exception {}
}