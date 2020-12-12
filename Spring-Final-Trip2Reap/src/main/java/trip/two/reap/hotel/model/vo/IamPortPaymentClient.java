package trip.two.reap.hotel.model.vo;

import org.aspectj.lang.annotation.Before;

import com.siot.IamportRestClient.IamportClient;

public class IamPortPaymentClient {
	IamportClient client;
	
	private IamportClient getNaverPaymentClient() {
		String api_key="";		//네이버페이 api키
		String api_secret="";	//네이버페이 시크릿키
		
		return new IamportClient(api_key, api_secret);
	}
	
	private IamportClient getBillingClient() {
		String api_key="";
		String api_secret="";
		
		return new IamportClient(api_key, api_secret);
	}
	
	
	
}
