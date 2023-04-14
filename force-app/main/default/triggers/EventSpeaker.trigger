trigger EventSpeaker on Event_Speaker__c (before insert,before update) {
    List<Id > SpeakerIds = new List<Id>();
    map <Id,Datetime> Requested_Booking = new map<Id,Datetime>();
    for(Event_Speaker__c esp : trigger.new){
        Requested_Booking.put(esp.Event__c,null);
        SpeakerIds.add(esp.Speaker__c);     
    }
    List<Event__c> RelatedEvent = [Select Id,Start_Date__c,End_Date__c from Event__c where Id IN :Requested_Booking.keySet()];
    for(Event__c Related_Event:RelatedEvent){
         Requested_Booking.put(Related_Event.Id,Related_Event.Start_Date__c);
        
    }
    List<Event_Speaker__c> Related_Speaker = [Select Id,Speaker__c,Event__c,Event__r.Start_Date__c from Event_Speaker__c where Speaker__c In :SpeakerIds];
    for(Event_Speaker__c esc : trigger.new){
        Datetime bookingtime = requested_booking.get(esc.Event__c);
        for(Event_Speaker__c speaker:Related_Speaker){
            if(speaker.Speaker__c ==esc.Speaker__c && (bookingtime>=Speaker.Event__r.Start_Date__c && bookingtime<= Speaker.Event__r.End_Date__c )){
                esc.addError('Duplicate booking found');
            }
            
        }
    }
}



   /* Set<String> speaker = new set<String>();
    for(Event_Speaker__c event : Trigger.new){
        speaker.add(event.Speaker__c);
    }
    Integer eventnum = [Select count() From  Event_Speaker__c Where Speaker__c In :speaker ];
    if(eventnum>0){
       for(Event_Speaker__c event : Trigger.new){
        event.addError('you already book an event');
        }
    }

}*/