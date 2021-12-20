public class AccessTokenNLSWrapper {    
    public String access_token;  
    public String expires_in; //300
    public String token_type; //Bearer
    public static AccessTokenNLSWrapper parse(String addressString){       
        return (AccessTokenNLSWrapper) System.JSON.deserialize(addressString, AccessTokenNLSWrapper.class);       
    }   
}