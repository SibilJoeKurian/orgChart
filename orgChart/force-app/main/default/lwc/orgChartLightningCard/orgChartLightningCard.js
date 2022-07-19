import { LightningElement,api } from 'lwc';

export default class OrgChartLightningCard extends LightningElement {
    @api name;
    @api email;
    @api title;
}