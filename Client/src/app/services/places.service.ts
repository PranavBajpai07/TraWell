import {Places} from '../model/place';
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { environment } from '../../environments/environment';

@Injectable()
export class PlaceService{
    constructor(private http: HttpClient){

    }

    getAllPlacesFromAPI(){
        return this.http.get(`${environment.apiBaseUrl}/citysearch`);
    }
}
