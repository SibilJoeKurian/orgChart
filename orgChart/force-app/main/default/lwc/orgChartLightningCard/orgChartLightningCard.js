import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import {MONTH_MAP} from 'c/utility_module';
export default class OrgChartLightningCard extends NavigationMixin(LightningElement) {
    @api name;
    @api email;
    @api title;
    @api profileId;
    @api hireDate;
    @api birthMonth;
    @api birthDay;
    @api photo;
    
    viewRecord(event) {
        let url = window.location.origin +'/'+event.currentTarget.dataset.id;
        window.open(url,'_blank').focus();
    }

    get getMonth(){
        return MONTH_MAP[this.birthMonth];
    } 

    get getPhoto(){
        return this.photo;
    }
}