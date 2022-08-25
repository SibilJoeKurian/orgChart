public with sharing class TA_Account_CheckDuplicate implements TriggerAction.BeforeInsert{
    public static final String DUPLICATE_ACCOUNT_ERROR_MSG = 'Duplicate Account Exist';
    public void beforeInsert(List<Account> newList){
        List<String> nameList = new List<String>();
        for(Account acc:newList){
            nameList.add(acc.name);
        } 
        List<Account> acc = [SELECT name from Account where name IN: nameList];
      
        for(Account currentAccount:newList){
            if(acc.size()!=0){
                currentAccount.addError(DUPLICATE_ACCOUNT_ERROR_MSG);
                throw newMessageException(DUPLICATE_ACCOUNT_ERROR_MSG);
                
            }
        }  
    }
    private AuraHandledException newMessageException(String message) {
        AuraHandledException e = new AuraHandledException(message);
        e.setMessage(message);
        return e;
    }
}