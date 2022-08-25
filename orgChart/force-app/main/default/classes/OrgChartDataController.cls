public with sharing class OrgChartDataController {
    @AuraEnabled(cacheable=true)
    public static List<Object> getOrgChartData(String sObjectName, String picklistField, String pictureFieldName, String emailFieldName){
        List<sobject> orgChartData;
        try{
            String query = 'SELECT Id, Org_Chart_Level__c, Name, '  +  picklistField + ', ' + pictureFieldName + ', ' + emailFieldName;
            query = query + ' FROM ' + sObjectName ;
            orgChartData = DataBase.query(query);
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        } 
        return orgChartData;
    }
}