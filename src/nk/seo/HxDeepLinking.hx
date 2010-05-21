/**
* ...
* @author Kastellanos Nikos
*/
package nk.seo;
import flash.events.EventDispatcher;
import flash.external.ExternalInterface;


public class HxDeepLinking extends EventDispatcher
{
	//implement sigleton
	public static var Current(getInstance, null):HxDeepLinking;
	private static var _instance:HxDeepLinking;
	private static var getInstance():HxDeepLinking
	{
		if (_instance == null) throw "You should call Init() first";
		return _instance;
	}
	private static var Init():HxDeepLinking
	{
		if (_instance != null) throw "class is allready initialized";
		if (!ExternalInterface.available) 
		{
			throw "class require ExternalInterface";
			return null;
		}
		_instance = new HxDeepLinking();
		return _instance;
	}
	
	private new()
 	{
		super(null);
		_Init();
	}
	
	private function _Init()
	{
		//set JS function for comunicate with browser
		if(ExternalInterface.available)
		{
			ExternalInterface.addCallback("HxDL_GetUrl",HxDL_GetUrl);
		}
		
		return;
	}
	
	private _GetLocationHash():String
	{
		var hash:String;
		hash = ExternalInterface.call("(window.location.hash");
		return hash;
	}
	
		
		
		
		
		
		

	
}