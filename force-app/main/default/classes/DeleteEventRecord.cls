public class DeleteEventRecord  implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator( [Select Id from Event__c Where Live__c =false AND End_date__c <= LAST_N_DAYS : 60]
          );
    }
    public void execute(Database.BatchableContext bc, List<Event__c> ev){
        delete ev;
        
    }
    public void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[]{'Mayank.raj@mirketa.com'};
            mail.setToAddresses(toAddress);
        mail.setSubject('Batch Job Complete');
        mail.setPlainTextBody('Hey,execution of the batch has been processed.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
    

}