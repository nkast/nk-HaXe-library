/**
* ...
* @author Kastellanos Nikos
*/

package nk.menu;
import flash.events.Event;

class MenuEvent extends Event
{
	public static var BUTTON_ADDED:String = "BUTTON_ADDED";
	public static var CONTAINER_ADDED:String = "CONTAINER_ADDED";
		
	public static var BUTTON_ACTIVATED:String = "BUTTON_ACTIVATED";
	public static var BUTTON_DEACTIVATED:String = "BUTTON_DEACTIVATED";
	public static var BUTTON_SELECTED:String = "BUTTON_SELECTED";
		
	public static var STATE_CHANGE:String = "STATE_CHANGE";
	
	
	public var SourceBtn:MenuBtnBase;
	
	public function new(type:String,sourceBtn:MenuBtnBase)
	{
		super(type);
		this.SourceBtn = sourceBtn;
	}
	
}