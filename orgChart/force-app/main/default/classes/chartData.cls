public class chartData {
    @AuraEnabled public Integer key;
    @AuraEnabled public String roleLevel;
    @AuraEnabled public Decimal titleNumber {get;set;}
    @AuraEnabled public Integer count;
    @AuraEnabled public List<singleLightningCardData> singleLevel;
        
    public class singleLightningCardData{
        @AuraEnabled public String name {get; set;}
        @AuraEnabled public String email {get; set;}
        @AuraEnabled public Id Id {get;set;}
        @AuraEnabled public String role {get; set;}
        @AuraEnabled public String title {get; set;}  
        @AuraEnabled public String hireDate {get; set;}
        @AuraEnabled public String birthMonth {get; set;}
        @AuraEnabled public String birthDay {get; set;}  
        @AuraEnabled public String photo {get;set;}
    }

    public chartData(String roleLevel,Decimal titleNumber,Integer key){
        this.singleLevel = new List<singleLightningCardData>();
        this.roleLevel = roleLevel;
        this.key = key;
        this.titleNumber = titleNumber;
    }

    //return the level data on the basis of the titleNumber
    public static List<singleLightningCardData> getLightningCard(Decimal titleNumber,String title,List<ChartData> chartDataList){
        for(chartData data: chartDataList){
            if(data?.titleNumber == titleNumber){
                if(!data?.roleLevel.contains(title)) {
                    data.roleLevel = data.roleLevel + ' / '+ title;
                }
                return data.singleLevel;
            }
        }
        return  null;
    }
    
}