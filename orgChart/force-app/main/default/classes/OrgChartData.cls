public with sharing class OrgChartData {
    @AuraEnabled
    public static List<OrgChartDataWrapper> getChartData(){
        List<OrgChartDataWrapper> orgChartDataList = new List<OrgChartDataWrapper>();
        try{
            List<Contact> contactDataList = [SELECT id, Name,Email,role__c,CDC_Title__c 
                                                FROM Contact];
            for(Contact c:contactDataList){
                OrgChartDataWrapper data = new OrgChartDataWrapper();
                data.name = c.name;
                data.email = c.email;
                data.uId = c.Id;
                data.role = c.role__c;
                data.title = c.CDC_Title__c;
                orgChartDataList.add(data);
            }
            return orgChartDataList;
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        } 
    }
    public class OrgChartDataWrapper{
        @AuraEnabled public String name {get; set;}
        @AuraEnabled public String email {get; set;}
        @AuraEnabled public Id uId {get;set;}
        @AuraEnabled public String role {get; set;}
        @AuraEnabled public String title {get; set;}
    }
}