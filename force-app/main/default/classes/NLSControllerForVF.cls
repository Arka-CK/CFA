public class NLSControllerForVF {
	public String currentApplicationId {get;set;}
	public String url {get;set;}
	public NLSControllerForVF(ApexPages.StandardController controller){}
	public PageReference nlsController(){
        currentApplicationId = ApexPages.currentPage().getParameters().get('Id');
        NLSCallout.nlsSearchLoanCalloutMethod(currentApplicationId);
        url = ApexPages.currentPage().getParameters().get('sfdcIFrameOrigin');
        PageReference pageReference = new PageReference(url + '/lightning/r/Account/'+ currentApplicationId +'/view');
        return pageReference;
    }
    public PageReference nlsGetLoanController(){
        currentApplicationId = ApexPages.currentPage().getParameters().get('Id');
        NLSCallout.nlsGetLoanCalloutMethod(currentApplicationId);
        url = ApexPages.currentPage().getParameters().get('sfdcIFrameOrigin');
        PageReference pageReference = new PageReference(url + '/lightning/r/Account/'+ currentApplicationId +'/view');
        return pageReference;
    }

}