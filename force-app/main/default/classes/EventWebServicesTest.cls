@isTest
private class EventWebServicesTest {
    @isTest static void testGetEventById() {
        //create a test data
        Event__c testEvent = new Event__c(Name__c='TestEvent',Start_Date__c = Date.Today(),Max_Seats__c=100);
        insert testEvent;
        //call the rest API services
        Test.startTest();
        List<Event__c> result= EventWebServices.getEventById();
        Test.stopTest();
        // Verify the results
 //System.assertEquals(1, result.size());
Event__c returnedEvent = result[0];
System.assertEquals(testEvent.Name__c, returnedEvent.Name__c);
System.assertEquals(testEvent.Start_Date__c, returnedEvent.Start_Date__c);
System.assertEquals(testEvent.Max_Seats__c, returnedEvent.Max_Seats__c);
}
}