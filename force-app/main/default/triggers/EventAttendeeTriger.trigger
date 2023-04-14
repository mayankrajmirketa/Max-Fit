//try{
 trigger EventAttendeeTriger on Event_Attendee__c (after insert) {
     set<id> AttendeeId = new set<id>();
    set<id> EventId = new set<id>();
     //get all email in the list
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
      for (Event_Attendee__c  myAttendee : Trigger.new) {
          if (myAttendee.Attendee__c!= null ) {
               AttendeeId.add(myAttendee.Attendee__c);
          }
       //  List<Attendee__c> AttendeeMail= new List<Attendee__c>();
       Attendee__c AttendeeMail = [Select Name, Email__c from Attendee__c Where id IN :AttendeeId];
           if (myAttendee.Event__c!= null ) {
               EventId.add(myAttendee.Event__c);
          }
          Event__c Eventinfo =[Select 	Organizer__r.Name,Start_Date__c,Location__r.Name,Name from Event__c Where id In :EventId ];
      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
   
      // Step 2: Set list of people who should get the email
         List<String> sendTo = new List<String>();
      sendTo.add(AttendeeMail.Email__c);
      mail.setToAddresses(sendTo);
               // Step 3: Set who the email is sent from
      //mail.setReplyTo('utkarsha.up10@gmail.com');
      mail.setSenderDisplayName(Eventinfo.Organizer__r.Name);
             // Step 4. Set email contents - you can use variables!
      mail.setSubject('Pass for the'+ Eventinfo.Name);
      String body = 'Dear ' + AttendeeMail.Name + ',';
       body += 'Thank you for registering for '+Eventinfo.Name +'” which will be Organized on'+ Eventinfo.Start_Date__c;
       body += '& will be held in'+ Eventinfo.Location__r.Name + '”. We are excited to have you, see you at the event.';
       body += 'Thanks,';
        body += Eventinfo.Organizer__r.Name;

      mail.setHtmlBody(body);
           // Step 5. Add your email to the master list
      mails.add(mail);
        Messaging.sendEmail(mails);  
}
 }
 // }
   // catch(Exception e){
   // e.getMessage();
        
   // }