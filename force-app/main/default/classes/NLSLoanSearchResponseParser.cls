/*********************************************************************************** 
* Company : Cloudkaptan Consultancy Services Pvt. Ltd.
* Date : 19/12/2021
* Author: Arka Jyoti Deb
* Description : This class helps in Parsing the JSON response that is generated by 
*				the NLS adapter class.
************************************************************************************/

public class NLSLoanSearchResponseParser {

    public Status status;
	public Payload payload;
    
	public class Status {
		public Integer code;
		public String message;
	}
    
    public class Payload {
		public Integer totalCount;
		public Integer count;
		public List<Data> data;
	}

	public class Data {
		public Integer Acctrefno;
		public Integer Loan_Type;
		public Integer Portfolio_Code_Id;
		public String Loan_Number;
		public Integer Cifno;
		public Integer Loan_Group_No;
		public String Shortname;
		public String Name;
		public Integer Loan_Class1_No;
		public Integer Loan_Class2_No;
		public Integer Risk_Rating_No;
		public String Entity;
		public Object Branch_Cifno;
		public Integer Status_Code_No;
		public Integer Loan_Officer_No;
		public Integer Collection_Officer_No;
		public Object Dealer_Cifno;
		public Integer Master_Acctrefno;
		public Integer Pool_Acctrefno;
		public Boolean Shadow_Loan_Exists;
		public String Curr_Maturity_Date;
		public String Interest_Accrued_Thru_Date;
		public Double Current_Note_Amount;
		public Double Current_Payoff_Balance;
		public Integer Days_Past_Due;
		public Object Closed_Date;
	}
	
	public static NLSLoanSearchResponseParser parse(String json) {
		return (NLSLoanSearchResponseParser) System.JSON.deserialize(json, NLSLoanSearchResponseParser.class);
	}
}