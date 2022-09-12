import { LightningElement,api } from 'lwc';

export default class OrgChartSection extends LightningElement {
    @api toggle = false;
    @api level;
    @api chartData;
    @api count;
    handleClick(event){
        this.toggle = event.detail;
    }
    get getToggle(){
        return this.toggle;
    }
    get currentLevel(){
        return this.level;
    }
}