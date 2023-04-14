public class EventRegistrationController {
    public Event_Organizer__c eorganizer{get;set;}
    public Event__c event{get;set;}
    public Location__c location{get;set;}
    public EventRegistrationController(){
        eorganizer= new Event_Organizer__c();
        event= new Event__c();
        location=new Location__c();

    }
    public void addEventOrganizer(){
        try{
         insert location;
         event.Organizer__c=eorganizer.Id;
         insert eorganizer;
         if(event.Event_Type__c!='virtual')
         event.location__c=location.Id;
         insert event;
         eorganizer= new Event_Organizer__c();
         event= new Event__c();
         location = new Location__c();


        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }


}