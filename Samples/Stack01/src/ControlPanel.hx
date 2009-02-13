/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.text.TextField;

class ControlPanel extends MovieClip
{
	
	public var iHAlignLeft:Button;
	public var iHAlignCenter:Button;
	public var iHAlignRight:Button;
	
	public var iVAlignTop:Button;
	public var iVAlignMiddle:Button;
	public var iVAlignBottom:Button;
	
	public var iGap:TextField;
	public var iWidth:TextField;
	public var iHeight:TextField;
	public var iSetGap:Button;

	public function new()
	{
		super();
		
		iHAlignLeft.iLabel.text = "Left";
		iHAlignCenter.iLabel.text = "Center";
		iHAlignRight.iLabel.text = "Right";
	
		iVAlignTop.iLabel.text = "top";
		iVAlignMiddle.iLabel.text = "Middle";
		iVAlignBottom.iLabel.text = "Bottom";
		
		iSetGap.iLabel.text = "Set";
	}
	
}
