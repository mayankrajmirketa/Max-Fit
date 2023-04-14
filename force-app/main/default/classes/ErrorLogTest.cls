@isTest
public  class ErrorLogTest {
    @isTest
    public Static void testmethod1(){
        String log = 'problem';
        String pro = 'process';
        Datetime dt = Datetime.newInstance(2022,3,15,7,8,16);
        ErrorLog el = new ErrorLog();
        Test.startTest();
        el.errorLog(dt, log, pro);
        Test.stopTest();
       
       
       // System.assertEquals(el.errorLog( Datetime.newInstance(2022,3,15,7,8,16), 'problem', 'process'),el.errorLog(dt, log, pro));
       
        
        
    
    }
        
    }