public class AccountUtils {

    public static List<Account> accountsByState (String stateAbbr) {
        return [SELECT Id, Name, BillingState FROM Account WHERE BillingState =: stateAbbr];
    }
}