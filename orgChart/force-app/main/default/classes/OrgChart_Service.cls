public with sharing class OrgChart_Service {
    public static Map<String, Type> objectToOrgChartImpl = new Map<String,Type>{
        'Contact'=>OrgChart_Service_Contact.class
    };
    public static List<Object>  getAllRecords(String objectName){
        OrgChart_Interface orgChartData = (OrgChart_Interface)objectToOrgChartImpl.get(objectName).newInstance();
        return orgChartData.getAllRecords();
    }
    public static List<Object> wrapRecordsForUI(List<Object> sObjectList, String objectName){
        OrgChart_Interface orgChartData = (OrgChart_Interface)objectToOrgChartImpl.get(objectName).newInstance();
        return orgChartData.wrapRecordsForUI(sObjectList);
    }
}
