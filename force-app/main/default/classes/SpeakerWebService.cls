/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Speaker/*')

global with sharing class SpeakerWebService {
    @HttpPost
global static String createSpeakerRecord(String name, String email, String phone, String company) {
Speaker__c speaker = new Speaker__c(
Name = name,
Email__c = email,
Phone__c = phone,
Company__c = company
);


//insert speaker;
//return speaker.Id;
 try {
 insert speaker;
 return '200 ';
 } catch (Exception ex) {
return '400 ';
 }
}
}