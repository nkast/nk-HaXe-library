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
	public var iAddMC04:Button;
	public var iAddMC05:Button;
	public var iClear:Button;
		
	public function new()
	{
		super();
		
		iAddMC01.iLabel.text = "MC 1";
		iAddMC02.iLabel.text = "MC 2";
		iAddMC03.iLabel.text = "MC 3";
		iAddMC04.iLabel.text = "MC 4";
		iAddMC05.iLabel.text = "MC 5";
		iClear.iLabel.text = "Clear";
		
	
	}
	
}
