@isTest
Private class EventSpeakerTriggerTest{
    @isTest
    static void duplicateSpeakerTest(){
        Event__c event1 = new Event__c(Name__c='Singing competition 1',Start_Date__c=System.now(),End_date__c=System.now().addDays(3),Event_Type__c='Virtual',Max_Seats__c=100);
       insert event1;
        Event__c event2 = new Event__c(Name__c='Singing competition 2',Start_Date__c=System.now(),End_date__c=System.now().addDays(3),Event_Type__c='Virtual',Max_Seats__c=100);
        insert event2;
        Speaker__c speaker= new Speaker__c( Name ='mayankdeep shrivatri');
        insert speaker;
        Test.startTest();
        try{
            Event_Speaker__c esc1=new Event_Speaker__c(Event__c=event1.Id,Speaker__c=speaker.Id);
            insert esc1;
             Event_Speaker__c esc2=new Event_Speaker__c(Event__c=event2.Id,Speaker__c=speaker.Id);
            insert esc2;
            List<Event_Speaker__c> lst1=[select Id,Event__c,Speaker__c from Event_Speaker__c where Id=:esc1.Id];
            DuplicateSpeakerInsert.insertEventSpeaker(lst1);
            List<Event_Speaker__c> lst2=[select Id,Event__c,Speaker__c from Event_Speaker__c where Id=:esc2.Id];
            DuplicateSpeakerInsert.insertEventSpeaker(lst2);
            
        }
        catch(Exception e){
            Boolean checkError=e.getMessage().contains('Duplicate booking found')?true:false;
            System.assertEquals(checkError, true);
        }
        test.stopTest();
    
    }

}











/*

@isTest
private class EventSpeakerTriggerTest{
    @testSetup
    static void setup() {
        // Insert necessary test records here
    }
    
    @isTest
    static void testDuplicateBooking() {
        // Create a test event and speaker
        Event__c testEvent = new Event__c(Name__c = 'Test Event', Start_Date__c = Date.today(), End_Date__c = Date.today().addDays(2));
        insert testEvent;
        Speaker__c testSpeaker = new Speaker__c(Name = 'Test Speaker');
        insert testSpeaker;
        
        // Create a test Event_Speaker__c record with the same speaker and event
        Event_Speaker__c duplicateRecord = new Event_Speaker__c(Speaker__c = testSpeaker.Id, Event__c = testEvent.Id);
        insert duplicateRecord;
        
        // Create a new Event_Speaker__c record with the same speaker and event
        Event_Speaker__c newRecord = new Event_Speaker__c(Speaker__c = testSpeaker.Id, Event__c = testEvent.Id);
        Test.startTest();
        try {
            insert newRecord;
            System.assert(false, 'Expected an error to be thrown.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Duplicate booking found'), 'Expected error message not found.');
        }
        Test.stopTest();
    }
}*/