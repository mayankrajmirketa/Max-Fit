public class ErrorLog {
    public  void errorLog(Datetime errordatetime,String log,String pro){
        Error_Log__c  err = new Error_Log__c();
        err.Log_Date_Time__c= errordatetime;
        err.Log_Details__c=log;
        err.Process_Name__c=pro;
        insert err;
        
    }

}