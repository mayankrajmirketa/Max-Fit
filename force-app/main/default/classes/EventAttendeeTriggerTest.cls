@isTest
public class EventAttendeeTriggerTest{
    @isTest
    static void makeData(){
        Event_Organizer__c eoc = new Event_Organizer__c(Name ='Mayank Raj',Email__c ='mayank.raj@mirketa.com',Phone__c='6205761080');
        insert eoc;
        Event__c ec = new Event__c(Name__c='singing competition',Start_Date__c=System.now(),End_date__c=System.now().addDays(3),Event_Type__c='Virtual',Frequency__c='Daily',Live__c=true,Recurring__c=true,Max_Seats__c=100);
        insert ec;
        Attendee__c at = new Attendee__c(Name = 'aman',Email__c='maynk742490@gmail.com',Phone__c='8409166340');
        insert at;
        Event_Attendee__c evtAtt =new Event_Attendee__c(Event__c=ec.Id,Attendee__c =at.Id);
        insert evtAtt;
        Test.startTest();
        List<Event_Attendee__c> eat =[Select Id,Event__c,Attendee__c from Event_Attendee__c where Id=:evtAtt.Id];
        EventAttendeeInsert.insertEventAttendee(eat);
        Integer invoc=Limits.getEmailInvocations();
        System.assertEquals(1,invoc);//,'An email should be sent'
        Test.stopTest();
        
    }
}
        /*
        //createing instance of attendee and event record
        Attendee__c testAttendee = new Attendee__c(Name = 'Test Attendee',Email__c ='test@gmail.com');
        insert testAttendee;
        Event__c testEvent =  new Event__c(Name__c='Test Event',Organizer__c=UserInfo.getUserId(),Start_Date__c=Datetime.now(),Location__c='Test Location');
        insert testEvent;
        //create event attendee record
        Event_Attendee__c testEventAttendee = new Event_Attendee__c(Attendee__C=testAttendee.Id,Event__c = testEvent.Id);
        insert testEventAttendee;
        //test email contents
        String expectedSubject = 'pass for the Test Event';
        String  expectedBody = 'Dear Test Attendee,Thank you for registering for Test Event which will be organized on'+Datetime.now().format()+'& will be held in Test Location.we are excited to have you,see you at the event.Thanks,'+UserInfo.getName();
        //verify email was sent
        Test.startTest();
        Messaging.SingleEmailMessage sentEmail = new Messaging.SingleEmailMessage();
       // System.assertEquals(1,Limits.getEmailInvocation());
       System.assertEquals(testAttendee.Email__c, sentEmail.getToAddresses()[0]);
        System.assertEquals(expectedSubject, sentEmail.getSubject());
        System.assertEquals(expectedBody, sentEmail.getHtmlBody());
        Test.stopTest();
          }
}*/