/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-11-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public  class CreateProductRecord {
    public static HttpResponse CreateProductRecord() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://fakestoreapi.com/products');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200) {
            String response=res.getBody();
            List<Object> productList = (List <Object>) JSON.deserializeuntyped(response);
            //Lists to insert
            List<Product2> proList = new List<Product2>();
            List <PricebookEntry> entryList = new List<PricebookEntry>();
            List <PricebookEntry> entryList2 = new List<PricebookEntry>();
            Pricebook2 pb = new Pricebook2(Name='MayankRaj-peicebook',Description='Price book',isActive=true);
            insert pb;
            Pricebook2 standardPb = new Pricebook2();
            if(Test.isRunningTest()){
                Id pbid = Test.getStandardPricebookId();
                standardPB.Id = pbid;
            }

            else {
                
             standardPb = [Select Id from Pricebook2 where IsStandard=true];
            }
            

            for(Object product:productList){
                Map<String,Object> productMap = (map<String,Object>) product;
                String title = (String) JSON.serialize(productMap.get('title'));
                title=title.substring(1,title.length()-1);
                String descript =(String) JSON.serialize(productMap.get('description'));
                descript = descript.substring(1,descript.length()-1);
                Product2 pro = new Product2(
                    ProductCode = (String) JSON.serialize(productMap.get('id')),
                    Name= title,
                    Description=descript
                    );
                    proList.add(pro);
              
            }
            insert proList;
            for(integer i=0;i<productList.size();i++){
                Object product = productList.get(i);
                id productid =proList.get(i).Id;
                Map<String,Object> productMap=(map<String,Object>)product;
                Decimal strToDec = decimal.valueOf(JSON.serialize(productMap.get('price')));
                PricebookEntry Entry = new PricebookEntry(
                    Pricebook2id=standardPb.id,
                    Product2id=productid,
                    UnitPrice=strToDec,
                    IsActive=true

                );
                entryList.add(entry);

            }
            insert entryList;

            for(integer i=0;i<productList.size();i++){
                Object product = productList.get(i);
                id productid =proList.get(i).Id;
                Map<String,Object> productMap=(map<String,Object>)product;
                Decimal strToDec = decimal.valueOf(JSON.serialize(productMap.get('price')));
                PricebookEntry Entry = new PricebookEntry(
                    Pricebook2id=PB.id,
                    Product2id=productid,
                    UnitPrice=strToDec,
                    IsActive=true

                );
                entryList2.add(entry);
    }
    insert entryList2;
}
return res;
}
}