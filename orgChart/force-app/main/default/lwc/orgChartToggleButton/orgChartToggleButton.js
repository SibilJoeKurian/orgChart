import { LightningElement,api } from 'lwc';

export default class OrgChartToggleButton extends LightningElement {
    @api level;
    @api toggle = false;
    @api count;
    handleOnClickToggle(){
        this.toggle?this.toggle=false:this.toggle=true;
        const selectedEvent = new CustomEvent("clickhanlder", {
            detail: this.toggle
        });
        this.dispatchEvent(selectedEvent);
    }
    get getToggle(){
        return this.toggle;
    }
}