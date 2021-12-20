global with sharing class Constants {
    
    //Constants for NLS Integration Family
    public static final String NLSAdapter = 'NLSAdapter';
    public static final String tokenUrl = 'https://q2box.cfafs.com:9090/core/connect/token';
    public static final String postMethod = 'POST';
    public static final String contentType = 'Content-Type';
    public static final String urlEncoded = 'application/x-www-form-urlencoded';
    public static final String encodingScheme = 'UTF-8';
    public static final String AccessTokenGenerator = 'AccessTokenGenerator';
    public static final String Attachment_loan_search = 'Response from NLS - /loan/seach';
    public static final String Attachment_Get_Loan = 'response for NLS loan(loanId)';
    public static final String NLSCallout = 'NLSCallout';
    public static final String NLSIntegrationFamily = 'NLS Integration';
    public static final String integrationApiTypeSearchLoan = 'Search Loans Integration API Type';
    public static final String accountId = 'accountId';
    public static final String loanId = 'loanId';
    public static final String integrationApiTypeGetLoan = 'Get loan Integration API Type';

    //Labels for authorization.
    public static final String grant_type = system.label.password;
    public static final String username = system.label.q2admin;
    public static final String password = system.label.password29cfa_Q2;
    public static final String scope = system.label.openid_api;
    public static final String client_id = system.label.apiuser;
    public static final String client_secret = system.label.password29cfa_Q2;

    //Constants with Exception messages.
    public static final String CalloutException = 'Error: Callout fails';
    public static final String accessTokenNull = 'Error: could not generate the Access Token';
    public static final String cifIsEmpty = 'Error: CIF number is empty.';
    public static final String invalidPartyType = 'Error: Invalid Party Type';

}
