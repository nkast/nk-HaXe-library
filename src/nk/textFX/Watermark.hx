/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.textFX;
import flash.events.FocusEvent;
import flash.text.TextField;

class Watermark 
{
	var target:TextField;
	var wmTxt:String;
	var wmColor:Int;
	var defaultColor:Int;
	
	public function new(target:TextField,wmTxt:String,wmColor:Int = 0xC0C0C0)
	{
		this.target = target;
		this.wmTxt = wmTxt;
		
		this.wmColor = wmColor;
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