trigger CreateContact on Candidate__c (after insert){
    //Invoke the createContact method with a list of Candidates as the argument
    CreateContactFromCan.createContact(Trigger.new);
}