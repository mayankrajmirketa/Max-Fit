@isTest
private class DeleteEventRecordTest {
    
    @testSetup
    static void setupTestData() {
        // Create test data for Event__c object
        List<Event__c> events = new List<Event__c>();
        for (Integer i = 0; i < 200; i++) {
            events.add(new Event__c(Name__c = 'Test Event ' + i, Live__c = false, Start_Date__c = Date.parse('10/01/2022'),End_date__c = Date.parse('15/01/2022')));
        }
        insert events;
    }
    
    @isTest
    static void testBatchJob() {
        Test.startTest();
        
        DeleteEventRecord batch = new DeleteEventRecord();
        Database.executeBatch(batch);
        
        Test.stopTest();
        
        // Verify if all events have been deleted
        System.assertEquals(0, [SELECT COUNT() FROM Event__c]);
    }
}
    
  /*  @isTest
    static void testBatchJobFinish() {
        Test.startTest();
        
        DeleteEventRecord batch = new DeleteEventRecord();
        Database.executeBatch(batch);
        
        Test.stopTest();
        
        // Verify if finish method has sent an email
       // List <Messaging.SingleEmailMessage> emails = new list <Messaging.SingleEmailMessage>();

        
        Messaging.SingleEmailMessage email =  new Messaging.SingleEmailMessage();//emails[0];
        System.assertEquals('Batch Job Complete', email.getSubject());
        System.assertEquals('Mayank.raj@mirketa.com', email.getToAddresses()[0]);
        System.assertEquals('Hey,execution of the batch has been processed.', email.getPlainTextBody());
    }
}*/