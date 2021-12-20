/**************************************************************************************************
* Company : Cloudkaptan Consultancy Services Pvt. Ltd.
* Date : 13/12/2021
* Author: Arka Jyoti Deb
* Description : This is a NLS Adapter Class which sends a request to the third party and get all the 
				application details in return as response.
***************************************************************************************************/

global with sharing class NLSAdapter extends intframework.BaseIntegrationAdapter{
    
    String accountId;
    public static final String accountParam = 'Account';
    public static final String id = 'ID';
    public static final String cif = 'CIF';
    public static final String partyType = 'partyType';
    public static final String Authorization = 'Authorization';
    
    //This method is responsible for generating the request body through RequsetBodyGeneratorHelper class.
    public override String generateRequestBody(Map<String, Object> requestMapping){
        String cifNumber ;
        String accountPartyType;
        String requestBody;
        RequsetBodyGeneratorHelper requestBodyGenerator = new RequsetBodyGeneratorHelper();
        List<Map<String, Object>> accounts = (List<Map<String, Object>>)requestMapping.get(accountParam);
        try{
            if(accounts.size() == 0 || accounts[0].get(id) == Null  
            		|| accounts[0].get(cif) == Null ){
            	throw new CustomException(Constants.cifIsEmpty);                                      
            }
            accountId = (String) accounts[0].get(id);
            cifNumber = (String) accounts[0].get(cif);
            accountPartyType = (String)requestMapping.get(partyType);
            requestBody = requestBodyGenerator.generateRequestbody(accountPartyType, cifNumber);
            return requestBody;   
        }catch (Exception objException) {
            Database.insert(new clcommon__Log__c(Name = Constants.NLSAdapter,
                    clcommon__Message__c = Constants.NLSAdapter 
                    + objException.getStackTraceString()
                    + objException.getMessage(),
                    clcommon__Time__c = System.Now()));    
            return null;
        }
    }
    
    //This method is responsible for performing the third party call-out 
    public override System.HttpResponse sendRequest(System.HttpRequest httpRequest){
        
        //Instantiating a new http request and new data types
        String accessToken;
        Http http = new Http();
        HttpResponse httpResponse;
        Attachment attachmentObj = new Attachment();
        AccessTokenNLSWrapper objAccessTokenNLSWrapper = new AccessTokenNLSWrapper();
        NLSLoanSearchResponseParser callParser = new NLSLoanSearchResponseParser();
        try{    
            accessToken = AccessTokenGenerator.getAccessToken();
            if(accessToken == null){
                throw new CustomException(Constants.accessTokenNull);
            }
            objAccessTokenNLSWrapper = AccessTokenNLSWrapper.parse(accessToken);
            httprequest.setHeader(Authorization, objAccessTokenNLSWrapper.token_type 
                                    + ' ' + objAccessTokenNLSWrapper.access_token );
            httpResponse = http.send(httpRequest);
            if(Attachment.SObjectType.getDescribe().isCreateable() && httpResponse.getBody()!= null){
                Blob blobObj = Blob.valueOf(httpResponse.getBody());
                attachmentObj.Body = blobObj;
                attachmentObj.ParentId = accountId;
                attachmentObj.Name = Constants.Attachment_loan_search;
                Database.insert(attachmentObj, false);
            }
            callParser = NLSLoanSearchResponseParser.parse(httpResponse.getBody());
            return httpResponse;
        }
        catch (Exception objException) {
            Database.insert(new clcommon__Log__c(Name = Constants.NLSAdapter ,
                    clcommon__Message__c = Constants.NLSAdapter  
                    + objException.getStackTraceString()
                    + objException.getMessage(),
                    clcommon__Time__c = System.Now()));   
            return null;
        }
    }
}