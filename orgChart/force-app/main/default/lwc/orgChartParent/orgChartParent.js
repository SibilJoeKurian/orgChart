import { LightningElement,track,api } from 'lwc';
import OrgChartData from '@salesforce/apex/OrgChartLWC_Controller.getDataForUI';
export default class OrgChartParent extends LightningElement {
    @track chartData = [];
    connectedCallback(){
        OrgChartData({"ObjectApiName":"Contact"}).then((data)=>{
            this.chartData = data;
        }).catch(e=>console.log(e))
    }
}