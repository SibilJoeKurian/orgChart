public with sharing class OrgChart_Service_Contact implements OrgChart_Interface{
    public static List<Contact> getAllRecords(){
        return [SELECT Id,name,email,Role__c,
                CDC_Title__c,Birthdate,Birth_Month__c,
                Bith_Day__c
                FROM Contact 
                WHERE CDC_Title__c !=null 
                ORDER BY CDC_Title_Level__c ];
    }

    public static List<Object> wrapRecordsForUI(List<Object> sObjectList){
        List<chartData> chartDataList = new List<chartData>();
        Integer uId=0;
        for(Contact cont: (List<Contact>)sObjectList){
           
            if(chartData.getLightningCard(cont.CDC_Title__c,chartDataList)==null){
                chartData newChartDataLevel = new chartData(cont.CDC_Title__c,(++uId));
                chartDataList.add(newChartDataLevel);
            }
            chartData.singleLightningCardData newPersonData = new ChartData.singleLightningCardData();
            newPersonData.name = cont.name;
            newPersonData.email = cont.email;
            newPersonData.Id = cont.Id;
            newPersonData.role = cont.Role__c;
            newPersonData.title = cont.CDC_Title__c;
            newPersonData.hireDate = String.ValueOf(cont.Birthdate);
            newPersonData.birthMonth = cont.Birth_Month__c;
            newPersonData.birthDay = cont.Bith_Day__c;
            chartData.getLightningCard(cont.CDC_Title__c,chartDataList).add(newPersonData);              
        }   
        return chartDataList;
    }
}