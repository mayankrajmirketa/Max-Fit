public class EventAttendeeInsert {
 public static void insertEventAttendee(List<Event_Attendee__c> lst){
 set<Id> attendeeId=new set<Id>();
 set<Id> eventId=new set<Id>();
 List<Messaging.SingleEmailMessage> mails =new List<Messaging.SingleEmailMessage>();
 for(Event_Attendee__c eac:lst){
 if(eac.Attendee__c!=null){ 
 attendeeId.add(eac.Attendee__c);
 }
 if(eac.Event__c!=null){
 eventId.add(eac.Event__c);
 } 
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
Attendee__c at=[Select Name,Email__c,Phone__c from Attendee__c where Id in :attendeeId]; 
Event__c et=[select Name__c,Organizer__r.Name,Location__r.Street__c,Location__r.City__c,Location__r.State__c,Location__r.Postal_Code__c,Start_Date__c from Event__c where Id in:eventId]; 
List<String> sendTo = new List<String>(); 
sendTo.add(at.Email__c);
 mail.setToAddresses(sendTo);
 mail.setSenderDisplayName(et.Organizer__r.Name);
 mail.setSubject('Pass for the '+et.Name__c); 
String body='Dear '+at.Name+', ';
 body+='Thank you for registering for '+et.Name__c+' which will be Organized on ';
 body+=et.Start_Date__c+' & will be held in '+et.Location__r.Street__c+'. ';
 body+='We are excited to have you, see you at the event.<br>';
 body+='Thanks,<br>'; body+=et.Organizer__r.Name;
 mail.setHtmlBody(body);
 mails.add(mail);
 Messaging.sendEmail(mails); 
}
}
}