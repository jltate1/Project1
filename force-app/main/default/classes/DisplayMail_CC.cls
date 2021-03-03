public class DisplayMail_CC {
  public String searchText {
    get {
      return searchText;
    }
    set {
      searchText = value;
    }
  }

 // Indicates whether records were found
 public Boolean matches {
     get {
         return ( (mail != null) && (mail.size() != 0) );
     }
     set;
 }

 public Boolean searched {get; set;}		// Indicates whether search has been done

 // Standard Set Controller
 public ApexPages.StandardSetController setMail { get; set; }     

 // Constructor
 public DisplayMail_CC() {
     searched = false;
 }

 // List of Mail displayed on the page
 public List<Mail__c> mail {
     get {
         if (setMail != null ) {
             return (List<Mail__c>)setMail.getRecords();
         } else {
             return null;
         }
     }
     set;
 }

 // Action method initiated by user
 public void Search() {

     if (String.isNotBlank(searchText) && searchtext.length() > 1) {

      List<Mail__c> mail = [SELECT Id, Name, Send_To__r.First_and_Last_name__c, Delivery_Status__c, Tracking_Number__c FROM Mail__c WHERE Tracking_Number__c =: searchText];

        setMail = new ApexPages.StandardSetController(mail);

       searched = true;
     } else {
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                             'Please enter search text at least two characters long'));
     }
 }
}