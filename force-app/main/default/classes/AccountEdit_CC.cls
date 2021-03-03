public inherited sharing class AccountEdit_CC {
    public List<Account> acc {get; set;}

    public AccountEdit_CC() {
        Id accID = [SELECT AccountId FROM User WHERE Id=: UserInfo.getUserId()].AccountId;
        acc = [SELECT Id, Name, NumberOfEmployees, Industry, Type, Website FROM Account WHERE id=: accID];
    }

    public PageReference quickUpdat() {
        try {
            update acc;
            return ApexPages.CurrentPage();
        }
        catch (Exception e) {
            System.debug('Error');
            return null;
        }
    }
}