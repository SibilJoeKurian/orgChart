import { LightningElement,api } from 'lwc';

export default class OrgChartSection extends LightningElement {
    toggle = false;
    @api level;
    @api contactData;
    handleClick(event){
        this.toggle = event.detail;
    }
}