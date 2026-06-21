
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { FinalDetails } from '../model/FinalDetails';
import { environment } from '../../environments/environment';



@Injectable()
export class PaymentService{
    
   
    finalDetails: FinalDetails;
    constructor(private http: HttpClient){
      
    }

    CreateNewBooking(){
       return this.http.post(`${environment.apiBaseUrl}/booking/CreateNewBooking`,this.finalDetails);
    }
}
