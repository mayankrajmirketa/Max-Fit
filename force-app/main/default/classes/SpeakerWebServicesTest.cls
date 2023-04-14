/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class SpeakerWebServicesTest {
    @isTest static void postSpeakerById() {
        Id thisSpeakerId = SpeakerWebService.createSpeakerRecord('Mayankabc','qanxj@gmail.com','9288292998','');
        System.assert(thisSpeakerId != null);
        Speaker__c speaker=[select id,Name,Email__c,Phone__c from Speaker__c where Id=:thisSpeakerId];
        System.assert(speaker != null);
        System.assertEquals(speaker.Name,'Mayankabc');


    }
}