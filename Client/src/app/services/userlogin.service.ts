
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { environment } from '../../environments/environment';




@Injectable()
export class UserLoginService{
   
    constructor(private http: HttpClient , private http2: HttpClient, private http3: HttpClient, private http4: HttpClient){
       
    }

    loginApi(email: string, password:string){
        var UserDetails = {
            Email: email,
            Password: password
        }

        return this.http.post(`${environment.apiBaseUrl}/User/SignIn`,UserDetails);
    }
    
    SignUpApi(firstName, lastName, password, contact, email){
        var UserDetails = {
            FirstName: firstName,
            LastName: lastName,
            Password: password,
            Contact: contact,
            Email: email
        }
        
        return this.http2.post(`${environment.apiBaseUrl}/User/SignUp`,UserDetails);
    }

    ChangePasswordApi(email, oldPassword, newPassword){
        var Details = {
            Email: email,
            Password: oldPassword,
            NewPassword: newPassword
        }

        return this.http3.post(`${environment.apiBaseUrl}/User/ChangePass`,Details);
    }

    GetTransactions(id:number){
        return this.http4.get(`${environment.apiBaseUrl}/User/GetTransactions?id=${id}`);
    }
}
