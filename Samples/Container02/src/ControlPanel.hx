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
		
		iAddMC01.iLabel.text = "MC 1";
		iAddMC02.iLabel.text = "MC 2";
		iAddMC03.iLabel.text = "MC 3";
	
	}
	
}
