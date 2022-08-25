import { api, wire, LightningElement } from 'lwc';
import getOrgChartData from '@salesforce/apex/OrgChartDataController.getOrgChartData';
import Format from '@salesforce/schema/Report.Format';
const map1 = new Map();
export default class OrgChartParentPOC extends LightningElement {
    OrgCharData = [];
    
    @api
    sObjectName = 'Contact';
    @api
    picklistField = 'CDC_Position__c';
    @api
    pictureFieldName = 'Picture__c';
    @api
    emailFieldName = 'Email';
    chartDataDS =[];
    
    @wire(getOrgChartData, {sObjectName: '$sObjectName', picklistField: '$picklistField', pictureFieldName:'$pictureFieldName' , emailFieldName:'$emailFieldName'})
    wiredRecords({ error, data }) {
        if (data) {
            let  sortedNumbers = Array.from([...new Set(data.map(e => e.Org_Chart_Level__c))]).sort((a, b) => a - b);
            console.log('sortedNumbers: ' + sortedNumbers);
            for (let item of sortedNumbers) {
                map1.set(item,[]);
                data.filter((e)=>{
                    if(e.Org_Chart_Level__c === item){
                        map1.get(item).push(e);
                    }
                });
            }
            let finalDataSet = [];
            map1.forEach((value, key) => finalDataSet.push({level:key,title:value[0].CDC_Position__c,length:value.length,data:value}))
            console.log('::: final data set '+finalDataSet);
            this.chartDataDS = [...finalDataSet];     
        } else if (error) {
            console.debug('error: ' +  JSON.stringify(error));
        }
    }
}