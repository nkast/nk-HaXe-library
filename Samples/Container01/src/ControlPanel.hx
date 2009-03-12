/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.text.TextField;

class ControlPanel extends MovieClip
{
	
	public var iAddMC01:Button;
	public var iAddMC02:Button;
	public var iAddMC03:Button;
		
	public function new()
	{
		super();
		
		iAddMC01.iLabel.text = "Fade";
		iAddMC02.iLabel.text = "Left";
		iAddMC03.iLabel.text = "Top";
	
	}
	
}
