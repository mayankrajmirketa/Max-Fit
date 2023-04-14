/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-12-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Event/*')
 global with sharing class EventWebServices { 
    @HttpGet
     global static List<Event__c> getEventById() {
         // RestRequest request = RestContext.request; 
         // String eventId = request.requestURI.substring( // request.requestURI.lastIndexOf('/')+1);
          List<Event__c> result = [SELECT Name,Start_Date__c,Max_Seats__c,Organizer__r.Name,Organizer__r.Email__c FROM Event__c]; 
          return result; 
        } 
    }