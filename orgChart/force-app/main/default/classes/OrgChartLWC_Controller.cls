public with sharing class OrgChartLWC_Controller {
    @AuraEnabled
    public static List<Object> getDataForUI(String ObjectApiName){
        List<Object> objList = OrgChart_Service.getAllRecords(objectApiName);
        return OrgChart_Service.wrapRecordsForUI(objList,objectApiName);
    }
}
