public with sharing class eventSpeakerController {
public Event__c event {get; set;}
public List <Event_Speaker__c> event_speaker {get; set;}
public eventSpeakerController() {
Id eventID = ApexPages.currentPage().getParameters().get('id');

 if(eventID != null){

 event = [Select Name__c,Organizer__r.Name, Location__c,Location__r.City__c,Location__r.Postal_Code__c,Location__r.state__c,Location__r.Country__c, Start_Date__c From Event__c Where Id = :eventID];
  event_speaker = [Select Event__c, Speaker__c,Speaker__r.Name, Speaker__r.Profile_URL__c, Speaker__r.About_me__c From Event_Speaker__c Where Event__c = :eventID];

 }
}
}