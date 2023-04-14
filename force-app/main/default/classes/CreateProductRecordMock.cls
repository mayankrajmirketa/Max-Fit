/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-11-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
global with sharing class CreateProductRecordMock implements HttpCalloutMock{
     // Implement this interface method
     global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{ "id":"1", "title":"Test Product","price":400 ,"Description":"this is Test Product"}]');
        response.setStatusCode(200);
        return response; 
     }
    }