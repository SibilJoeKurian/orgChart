import { LightningElement,track } from 'lwc';
import OrgChartData from '@salesforce/apex/OrgChartData.getChartData';
export default class OrgChartParent extends LightningElement {
    @track contacts = [];
    @track levelOne = [];
    @track levelTwo = [];
    @track levelThree = [];
    @track levelFour = [];
    @track levelFive = [];
    connectedCallback(){
        OrgChartData().then(data=>{
            this.contacts = [...data];
            data.forEach(e => {
                if(e.title === 'Solution Architect'){
                    this.levelOne = [...this.levelOne,{id:e.uId,name:e.name,email:e.email,title:e.title}];
                }else if(e.title === 'Senior Solution Designer'){
                    this.levelTwo = [...this.levelTwo,{id:e.uId,name:e.name,email:e.email,title:e.title}];
                }else if(e.title === 'Solution Designer'){
                    this.levelThree = [...this.levelThree,{id:e.uId,name:e.name,email:e.email,title:e.title}];
                }else if(e.title === 'Solution Developer'){
                    this.levelFour = [...this.levelFour,{id:e.uId,name:e.name,email:e.email,title:e.title}];
                }else if(e.title === 'Solution Associate'){
                    this.levelFive = [...this.levelFive,{id:e.uId,name:e.name,email:e.email,title:e.title}];
                }
            });
            console.log('::: level one '+this.levelOne);
            console.log('::: level one '+this.levelTwo);
            console.log('::: level one '+this.levelThree);
            console.log('::: level one '+this.levelFour);
        })
        
    }
}