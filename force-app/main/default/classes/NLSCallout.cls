/**************************************************************************************************
* Company : Cloudkaptan Consultancy Services Pvt. Ltd.
* Date : 17/12/2021
* Author: Arka Jyoti Deb
* Description : This is a NLS Callout Class which sends the account Id to the Integration framework and get all the 
				active-loan, loan-details in return as response from different methods .
***************************************************************************************************/


global with sharing class NLSCallout {
    
    public static final String loanId = '134390';
    // This method will call NLS Search Loans API Configuration Integration framework.
    webservice static void nlsSearchLoanCalloutMethod(String accountId) {
			
        Map<String, Object> requestParamMap = new Map<String, Object>();
        Map<String, Object> queryIdMap = new Map<String, Object>();
        try {
            queryIdMap.put(Constants.accountId,accountId);
            //Calling the integration framework
            intframework.AbstractIntegrationService baseIntegrationService = intframework.IntegrationServiceFactory.getBaseIntegrationService();
            intframework.BaseIntegrationResponse responseObject;
			responseObject = (intframework.BaseIntegrationResponse)baseIntegrationService.runSynchronousIntegrationService( Constants.NLSIntegrationFamily,
                                                                                                                                Constants.integrationApiTypeSearchLoan,
                                                                                                                                queryIdMap, requestParamMap);
            
        } catch (Exception objException) {
            Database.insert(new clcommon__Log__c(Name = Constants.NLSCallout ,
                    clcommon__Message__c = Constants.NLSCallout  
                    + objException.getStackTraceString()
                    + objException.getMessage(),
                    clcommon__Time__c = System.Now()));
        }
    }
    
    // This method will call NLS Get Loan API Configuration Integration framework.
    webservice static void nlsGetLoanCalloutMethod(String accountId) {
			
        Map<String, Object> requestParamMap = new Map<String, Object>();
        Map<String, Object> queryIdMap = new Map<String, Object>();
        try {
            requestParamMap.put(Constants.accountId, accountId);
            requestParamMap.put(Constants.loanId, loanId);
            //Calling the integration framework
            intframework.AbstractIntegrationService baseIntegrationService = intframework.IntegrationServiceFactory.getBaseIntegrationService();
            intframework.BaseIntegrationResponse responseObject;
			responseObject = (intframework.BaseIntegrationResponse)baseIntegrationService.runSynchronousIntegrationService(Constants.NLSIntegrationFamily,
                                                                                                                                Constants.integrationApiTypeGetLoan,
                                                                                                                                queryIdMap, requestParamMap);
            
        } catch (Exception objException) {
            Database.insert(new clcommon__Log__c(Name = Constants.NLSCallout ,
                    clcommon__Message__c = Constants.NLSCallout  
                    + objException.getStackTraceString()
                    + objException.getMessage(),
                    clcommon__Time__c = System.Now()));
        }
    }
}