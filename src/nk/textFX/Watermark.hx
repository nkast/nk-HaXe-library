/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.events.FocusEvent;
import flash.text.TextField;

class nk.textFX.Watermark 
{
	var target:TextField;
	var wmTxt:String;
	var wmColor:Int;
	var defaultColor:Int;
	
	public function new(target:TextField,wmTxt:String)
	{
		this.target = target;
		this.wmTxt = wmTxt;
		
		this.wmColor = 0xA0A0A0;
		this.defaultColor = this.target.textColor;
		
		this.target.text = wmTxt;		
		target.textColor = wmColor;
		
		target.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
		target.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
		return;
	}
	
	function onFocusIn(event:FocusEvent):Void 
	{
		if (target.text == wmTxt)
		{   
			target.text = "";
			target.textColor = defaultColor;
		}       
	}	
	function onFocusOut(event:FocusEvent):Void
	{
		if (target.text == "")
		{
			target.text = wmTxt;
			target.textColor = wmColor;
		}
	}	
	
	
}