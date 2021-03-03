@isTest
public class AccountTriggerTest {
@isTest static void TestCreateNewAccount() {
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i, BillingState='CA');
            accts.add(acct);
        }              
        // Perform Test
        Test.startTest();
        insert accts;                               
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id FROM Account WHERE ShippingState = 'CA' AND BillingState='CA'];
        System.assertEquals(200, verifyAccts.size()); 
    	                           
    }
}