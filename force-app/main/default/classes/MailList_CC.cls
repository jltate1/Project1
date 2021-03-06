public class MailList_CC {
    public List<Mail__c> packageList {
        get {
            if (packageList == null) {
            for (Mail__c newMail : packageList) {
                packageList.add(newMail);
            }
		}
            return packageList;
        }
        
        set;}
    public String userName {
        get {
            if (userName == null) {
            //get first and last name 
            userName = UserInfo.getFirstName() + ' ' + UserInfo.getLastName();
            }
            return userName;
        }
  
        set;
    }
    public MailList_CC() {
        //used get user id to display user packages
        ID contactId = [SELECT ContactId FROM User WHERE id = :Userinfo.getUserId()].contactId;
       	packageList  = [SELECT Delivery_Status__c, Name, Send_To__r.First_and_Last_name__c FROM Mail__c WHERE Send_To__r.First_and_Last_name__c = :contactId AND Delivery_Status__c = 'Shipped'];
    }
}