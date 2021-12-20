/*********************************************************************************** 
* Company : Cloudkaptan Consultancy Services Pvt. Ltd.
* Date : 13/12/2021
* Author: Arka Jyoti Deb
* Description : This class helps in authorization and generating the acces token.
************************************************************************************/

public class AccessTokenGenerator{
    
    // This method helps to callout the third party and generate the access token in return.
    public static String getAccessToken() {
        
        try{
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(Constants.tokenUrl);
            request.setMethod(Constants.postMethod);
            request.setHeader(Constants.contentType, Constants.urlEncoded);
            String payload = 'grant_type=' +EncodingUtil.urlEncode(Constants.grant_type, Constants.encodingScheme)
                                    +'&username='+EncodingUtil.urlEncode(Constants.username,Constants.encodingScheme)
                                    +'&password='+EncodingUtil.urlEncode(Constants.password,Constants.encodingScheme)
                                    +'&scope='+EncodingUtil.urlEncode(Constants.scope,Constants.encodingScheme)
                                    +'&client_id='+EncodingUtil.urlEncode(Constants.client_id,Constants.encodingScheme)
                                    +'&client_secret='+EncodingUtil.urlEncode(Constants.client_secret,
                                                                                    Constants.encodingScheme);    
            request.setBody(payload);
            HttpResponse response = http.send(request);
            if(response.getStatusCode() != 200) {
                throw new CustomException(Constants.CalloutException);
            }
            return response.getBody();
        }catch (Exception objException) {
            Database.insert(new clcommon__Log__c(Name = Constants.AccessTokenGenerator ,
                                                    clcommon__Message__c = Constants.AccessTokenGenerator  
                                                    + objException.getStackTraceString()
                                                    + objException.getMessage(),
                                                    clcommon__Time__c = System.Now()));   
            return null;
        }
    }
}