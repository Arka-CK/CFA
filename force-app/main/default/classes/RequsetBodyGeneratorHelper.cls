/* 
* Company : Cloudkaptan Consultancy Services Pvt. Ltd.
* Date : 13/12/2021
* Author: Arka Jyoti Deb
* Description : This is a Helper class which generates the request-body for the NLS Adpter Class.
*/

public with sharing class RequsetBodyGeneratorHelper {
    
    // This method is responsible for generating the request body for the adapter class.
    public String generateRequestbody(String partyType, String cifNumber){ 
        String requestBody;
        // if-else
       	if(partyType.equalsIgnoreCase('DEALER')){
            requestBody = '{"Portfolio_Code_Id": "","Acctrefno": "","Loan_Number": "","Cifno": "","Cifnumber": "",'
                    +'"Loan_Group_No": "","Investor": {"Cifnumber": ""},"Shortname": "","Name": "",'
                    +'"Loan_Class1_No": "","Loan_Class2_No": "","Risk_Rating_No": "","Entity": "","Tin": "",'
                    +'"Tin_Hash": "","Status_Code_No": "0","Status_Codes": {"HasNone": false,"ApplyOrOperator": false,'
                    +'"SelectionsToInclude": [],"SelectionsToExclude": []},"Loan_Officer_No": "",'
                    +'"Collection_Officer_No": "","Input_Date": "","Open_Date": "","Curr_Date": "",'
                    +'"Curr_Maturity_Date": "","Payoff_Date": "","Closed_Date": "","Last_Activity_Date": "",'
                    +'"Interest_Accrued_Thru_Date": "","Interest_Paid_Thru_Date": "","Principal_Paid_Thru_Date": "",'
                    +'"Next_Statement1_Date": "","Next_Accrual_Cutoff": "","Loan_Type": "","Interest_Method": "",'
                    +'"Current_Interest_Rate": "","Term": "","Term_Due": "","Term_Char": "","SAC_Expiration_Date": "",'
                    +'"SAC_Ineligible_Date": "","Credit_Line_Limit": "","Current_Note_Amount": "",'
                    +'"Current_Perdiem": "","Current_Servicing_Balance": "","Current_Principal_Balance": "",'
                    +'"Current_Interest_Balance": "","Current_Def_Interest_Balance": "","Current_Fees_Balance": "",'
                    +'"Current_Late_Charge_Balance": "","Current_Udf1_Balance": "","Current_Udf2_Balance": "",'
                    +'"Current_Udf3_Balance": "","Current_Udf4_Balance": "","Current_Udf5_Balance": "",'
                    +'"Current_Udf6_Balance": "","Current_Udf7_Balance": "","Current_Udf8_Balance": "",'
                    +'"Current_Udf9_Balance": "","Current_Udf10_Balance": "","Current_Payoff_Balance": "",'
                    +'"Current_Suspense": "","Current_Impound_Balance": "","Current_Ol1_Balance": "",'
                    +'"Current_Ol2_Balance": "","Current_Ol3_Balance": "","Balloon_Payment_Amount": "",'
                    +'"Balloon_Payment_Date": "","Next_Principal_Due_Amount": "","Next_Principal_Payment_Date": "",'
                    +'"Next_Interest_Due_Amount": "","Next_Interest_Payment_Date": "","Next_Payment_Total_Amount": "",'
                    +'"Last_Payment_Amount": "","Last_Payment_Date": "","Total_Past_Due_Balance": "",'
                    +'"Days_Past_Due": "","Total_Current_Due_Balance": "","InterestOnlyPeriod": false,'
                    +'"ParentOfShadowLoan": false,"Participant": {"Participantrefno": "","Participant_Number": "",'
                    +'"Shortname": "","Loan_Group_No": ""},"Cif_Loan_Relationship": {"Cifno": "","Cifnumber": "'
                    + cifNumber +'","Relationship_Code_Id": ""},"Transaction_History": {"Transaction_Date": "",'
                    +'"Effective_Date": "","Gl_Date": "","Transaction_Code": "","Transaction_Amount": "",'
                    +'"User_Reference": "","Payment_Method_No": "","Payment_Method_Reference": "","Userdef01": "",'
                    +'"Userdef02": "","Userdef03": "","Userdef04": "","Userdef05": ""},'
                    +'"Payment_History": {"Date_Due": "","Date_Paid": "","Gl_Date": "","Payment_Amount": "",'
                    +'"User_Reference": "","Payment_Method_No": "","Payment_Method_Reference": "","Userdef01": "",'
                    +'"Userdef02": "","Userdef03": "","Userdef04": "","Userdef05": "","SearchPayoffsOnly": false,'
                    +'"SearchPaymentsOnly": false},"Promise_To_Pay": {"Promise_Date": "","Promise_Kept_Date": "",'
                    +'"Promise_Amount": "","SearchBrokenPromisesOnly": false,"SearchSoftBrokenPromisesOnly": false,'
                    +'"Promise_Broken_Date": "","Promise_Softbroken_Date": ""},"Next_Impound_Analysis_Date": "",'
                    +'"Branch_Cifno": "","BranchDivisionID": "","Dealer_Cifno": "","Master_Acctrefno": "",'
                    +'"Pool_Acctrefno": ""}';
        } else if(partyType.equalsIgnoreCase('GROWER')){
            requestBody = '{"Portfolio_Code_Id": "","Acctrefno": "","Loan_Number": "","Cifno": "","Cifnumber": "'
                    + cifNumber +'","Loan_Group_No": "","Investor": {"Cifnumber": ""},"Shortname": "","Name": "",'
                    +'"Loan_Class1_No": "","Loan_Class2_No": "","Risk_Rating_No": "","Entity": "","Tin": "",'
                    +'"Tin_Hash": "","Status_Code_No": "0","Status_Codes": {"HasNone": false,"ApplyOrOperator": false,'
                    +'"SelectionsToInclude": [],"SelectionsToExclude": []},"Loan_Officer_No": "",'
                    +'"Collection_Officer_No": "","Input_Date": "","Open_Date": "","Curr_Date": "",'
                    +'"Curr_Maturity_Date": "","Payoff_Date": "","Closed_Date": "","Last_Activity_Date": "",'
                    +'"Interest_Accrued_Thru_Date": "","Interest_Paid_Thru_Date": "","Principal_Paid_Thru_Date": "",'
                    +'"Next_Statement1_Date": "","Next_Accrual_Cutoff": "","Loan_Type": "","Interest_Method": "",'
                    +'"Current_Interest_Rate": "","Term": "","Term_Due": "","Term_Char": "","SAC_Expiration_Date": "",'
                    +'"SAC_Ineligible_Date": "","Credit_Line_Limit": "","Current_Note_Amount": "",'
                    +'"Current_Perdiem": "","Current_Servicing_Balance": "","Current_Principal_Balance": "",'
                    +'"Current_Interest_Balance": "","Current_Def_Interest_Balance": "","Current_Fees_Balance": "",'
                    +'"Current_Late_Charge_Balance": "","Current_Udf1_Balance": "","Current_Udf2_Balance": "",'
                    +'"Current_Udf3_Balance": "","Current_Udf4_Balance": "","Current_Udf5_Balance": "",'
                    +'"Current_Udf6_Balance": "","Current_Udf7_Balance": "","Current_Udf8_Balance": "",'
                    +'"Current_Udf9_Balance": "","Current_Udf10_Balance": "","Current_Payoff_Balance": "",'
                    +'"Current_Suspense": "","Current_Impound_Balance": "","Current_Ol1_Balance": "",'
                    +'"Current_Ol2_Balance": "","Current_Ol3_Balance": "","Balloon_Payment_Amount": "",'
                    +'"Balloon_Payment_Date": "","Next_Principal_Due_Amount": "","Next_Principal_Payment_Date": "",'
                    +'"Next_Interest_Due_Amount": "","Next_Interest_Payment_Date": "","Next_Payment_Total_Amount": "",'
                    +'"Last_Payment_Amount": "","Last_Payment_Date": "","Total_Past_Due_Balance": "",'
                    +'"Days_Past_Due": "","Total_Current_Due_Balance": "","InterestOnlyPeriod": false,'
                    +'"ParentOfShadowLoan": false,"Participant": {"Participantrefno": "","Participant_Number": "",'
                    +'"Shortname": "","Loan_Group_No": ""},"Cif_Loan_Relationship": {"Cifno": "","Cifnumber": "'
                    +'","Relationship_Code_Id": ""},"Transaction_History": {"Transaction_Date": "",'
                    +'"Effective_Date": "","Gl_Date": "","Transaction_Code": "","Transaction_Amount": "",'
                    +'"User_Reference": "","Payment_Method_No": "","Payment_Method_Reference": "","Userdef01": "",'
                    +'"Userdef02": "","Userdef03": "","Userdef04": "","Userdef05": ""},'
                    +'"Payment_History": {"Date_Due": "","Date_Paid": "","Gl_Date": "","Payment_Amount": "",'
                    +'"User_Reference": "","Payment_Method_No": "","Payment_Method_Reference": "","Userdef01": "",'
                    +'"Userdef02": "","Userdef03": "","Userdef04": "","Userdef05": "","SearchPayoffsOnly": false,'
                    +'"SearchPaymentsOnly": false},"Promise_To_Pay": {"Promise_Date": "","Promise_Kept_Date": "",'
                    +'"Promise_Amount": "","SearchBrokenPromisesOnly": false,"SearchSoftBrokenPromisesOnly": false,'
                    +'"Promise_Broken_Date": "","Promise_Softbroken_Date": ""},"Next_Impound_Analysis_Date": "",'
                    +'"Branch_Cifno": "","BranchDivisionID": "","Dealer_Cifno": "","Master_Acctrefno": "",'
                    +'"Pool_Acctrefno": ""}';
        }else {
            throw new CustomException(Constants.invalidPartyType);                                      
        }
        system.debug('Request body generator helper ' + requestBody);
        return requestBody; // retuning the request body to the NLSAdapter class 
    }
}