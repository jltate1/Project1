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
            userName = UserInfo.getFirstName() + ' ' + UserInfo.getLastName();//get first and last name 
            }
            return userName;
        }
  
        set;
    }
    public MailList_CC() {
        ID contactId = [SELECT ContactId FROM User WHERE id = :Userinfo.getUserId()].contactId;//used get user id to display user packages
       	packageList  = [SELECT Delivery_Status__c, Name FROM Mail__c WHERE Id = :contactId AND Delivery_Status__c = 'Shipped'];
    }
}