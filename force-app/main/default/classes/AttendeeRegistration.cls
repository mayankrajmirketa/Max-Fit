public class AttendeeRegistration {
    public Attendee__c  attendee{get;set;}
     public Event_Attendee__c eventAttendee{get;set;}
    public Location__c location{get;set;}
    public AttendeeRegistration(){
        attendee=new Attendee__c();
        eventAttendee=new Event_Attendee__c();
        location= new Location__c();
    }
    public void save(){
        try{
            insert location;
            attendee.Address__c=location.Id;
            insert attendee;
            eventAttendee.Attendee__c=attendee.Id;
            insert eventAttendee;
             attendee=new Attendee__c();
        eventAttendee=new Event_Attendee__c();
        location= new Location__c();
         
        }
         catch(Exception e){
            System.debug(e.getMessage());
        }
    }

}