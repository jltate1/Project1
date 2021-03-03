public class PastDeliveries_CC {
    public PastDeliveries_CC() {}

    public static final String PAST_DELIVERY_TAG = 'Delivered';

    public ID userContactId {
        get {
            if (userContactId == null) {
                userContactId = [SELECT ContactId FROM User WHERE id = :Userinfo.getUserId()].contactId;
            }
            return userContactId; 
        }
        private set;
    }
    
    public List<Mail__c> mailDelivered {
        get {
            if (mailDelivered == null) {
            
                mailDelivered =  [
                    SELECT Id, Name, Tracking_Number__c, 
                    Delivery_Status__c, 
                    Send_To__r.First_and_Last_name__c
                    FROM Mail__c 
                    WHERE Delivery_Status__c = :PAST_DELIVERY_TAG 
                    AND Send_To__r.First_and_Last_name__c = :userContactId

                ];
            }
            return mailDelivered;
        }
        private set;
    }


}
