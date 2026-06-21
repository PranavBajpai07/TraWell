import {SearchQuery} from '../model/searchquery';
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {SearchQueryToSend} from '../model/searchquerytosend';
import { environment } from '../../environments/environment';


@Injectable()
export class SearchQueryService{
    searchquery: SearchQuery;
    constructor(private http: HttpClient , private http2: HttpClient){
       
    }

    getSearchResult(search: SearchQueryToSend){
       
        return this.http.post(`${environment.apiBaseUrl}/searchquery`,search);
    }
}
