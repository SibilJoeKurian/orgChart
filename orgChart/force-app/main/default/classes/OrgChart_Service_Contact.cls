public with sharing class OrgChart_Service_Contact implements OrgChart_Interface{
    public static List<Contact> getAllRecords(){
        return [SELECT Id,name,email,
                CDC_Title__c,Birthdate,Birth_Month__c,
                Birth_Day__c,Photo__c,Join_Date__c,
                CDC_Title_Level__c
                FROM CONTACT 
                WHERE CDC_Title__c !=null 
                AND Active__c = true
                ORDER BY CDC_Title_Level__c
            ];
    }

    public static List<Object> wrapRecordsForUI(List<Object> sObjectList){
        List<chartData> chartDataList = new List<chartData>();
        Integer uId=0;
        for(Contact cont: (List<Contact>)sObjectList){
           //chart level not exist
            if(chartData.getLightningCard(cont.CDC_Title_Level__c,cont.CDC_Title__c,chartDataList) == null ){
                //create new level
                chartData newChartDataLevel = new chartData(cont.CDC_Title__c,cont.CDC_Title_Level__c,(++uId));
                chartDataList.add(newChartDataLevel);
            }
            chartData.singleLightningCardData newPersonData = new ChartData.singleLightningCardData();
            newPersonData.name = cont.name;
            newPersonData.email = cont.email;
            newPersonData.Id = cont.Id;
            newPersonData.title = cont.CDC_Title__c;
            newPersonData.hireDate = String.ValueOf(cont.Join_Date__c);
            newPersonData.birthMonth = cont.Birth_Month__c;
            newPersonData.birthDay = cont.Birth_Day__c;
            newPersonData.photo = cont.Photo__c;
            //get the level and add the new person data
            chartData.getLightningCard(cont.CDC_Title_Level__c,cont.CDC_Title__c,chartDataList).add(newPersonData);              
        } 
        for( chartData cd : chartDataList){
            cd.count = cd.singleLevel.size();
        }
        return chartDataList;
    }
}