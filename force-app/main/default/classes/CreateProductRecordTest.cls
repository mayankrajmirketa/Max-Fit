/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-11-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
Private class CreateProductRecordTest{
    @isTest 
static void testCreateProductRecord(){
    Test.setMock(HttpCalloutMock.class,new CreateProductRecordMock());
    HttpResponse response=CreateProductRecord.CreateProductRecord();
    System.assertEquals(200, response.getStatusCode(),'Sucessful Authentication');
    Product2 product =[select Id,Name from Product2 where Name='Test Product'];
    System.assertEquals(product.Name,'Test Product');
    Pricebook2 pricebook =[select Id,Name from Pricebook2 where Name='MayankRaj-peicebook'];
    System.assertEquals(pricebook.Name,'MayankRaj-peicebook');
    List<PricebookEntry> customEntry=[select ID from PricebookEntry where Pricebook2Id=:pricebook.Id AND Product2Id=:product.Id];
    System.assertEquals(customEntry.size(),1);
}


}