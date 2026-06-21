
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { environment } from '../../environments/environment';



@Injectable()
export class GuestUserService{
    
   
    constructor(private http: HttpClient , private http2: HttpClient){
       
    }

    CheckandAddUser(email: string, contact: string){
        var User = {
            Email: email,
            Contact: contact
        }

        return this.http.post(`${environment.apiBaseUrl}/User/CheckGuestUser`,User);
    }

    
}
