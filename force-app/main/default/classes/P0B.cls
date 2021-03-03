public with sharing class P0B {
    
	public static void updateAccountSize( ) {

        List<Account> accts = [SELECT Name, NumberOfEmployees, Size__c FROM Account];
        for (Account a : accts) {
            if (a.NumberOfEmployees > 0 && a.NumberOfEmployees < 1001) {
                a.Size__c = 'Small';
            }
            else if (a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10001) {
                a.Size__c = 'Medium';
            }
            else if (a.NumberOfEmployees > 10000) {
                a.Size__c = 'Large';
            }
        }
        update accts;
    }
        
	public static void updateCALeads( ) {

        List<Lead> leads = [SELECT Status, State FROM Lead WHERE State = 'CA'];
        for (Lead b: leads) {
            b.Status = 'Closed - Not Converted';
            b.Description = 'We are no longer doing business in California';
        }
        update leads;
	}
     
    public static Boolean bracketsAreBalanced( String s ) {

        List<Integer> stringStack = new List<Integer>();
        for (Integer i = 0; i < s.length(); i++) {
            Integer temp = s.charAt(i);   
            if (temp == 91 || temp == 40 || temp == 123) {
                stringStack.add(temp);
            } else if (temp == 93) {
                if (stringStack.isEmpty() || stringStack.remove(stringStack.size() - 1) != 91) {
                    return false;
                }
            } else if (temp == 41) {
                if (stringStack.isEmpty() || stringStack.remove(stringStack.size() - 1) != 40) {
                    return false;
                }
            } else if (temp == 125) {
                if (stringStack.isEmpty() || stringStack.remove(stringStack.size() - 1) != 123) {
                    return false;
                }
            }
        }
        System.debug(stringStack.isEmpty());
    	return stringStack.isEmpty();
	}
    
    public static void closePastDueOpportunities( ) {

        List<Opportunity> opp = [SELECT CloseDate, StageName FROM Opportunity WHERE CloseDate < TODAY AND StageName != 'Closed Won'];
        for (Opportunity c: opp) {
            c.StageName = 'Closed Lost';
        }
        update opp;
    }
    
    public static Integer nFibonacci (Integer n ) {
        if (n <= 1) {
            return n;
        }
        return nFibonacci(n-1) + nFibonacci(n-2);
    }
    
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {

        for (Integer i = 0; i < n; i++) {
            Integer temp = nList[0];
            for(Integer j = 0; j < nList.size()-1; j++) {
                nList[j] = nList[j+1];
            }
            nList[nList.size() - 1] = temp;
        }

        System.debug(nList);
        return nList;

    }
    
    public static List<Integer> sortList( List<Integer> intList ) {

        Integer key;
        for (Integer a = 0; a < intList.size(); a++) {
            key = intList[a];
            Integer b = a - 1;

            while (b >= 0 && intList[b] > key) {
                intList[b+1] = intList[b];
                b = b - 1;
            }
            intList[b+1] = key;
        }

        return intList;

    }
    
    
    
    
    
      
}