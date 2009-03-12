/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.text.TextField;

class Button extends MovieClip
{
	
	public var iLabel:TextField;

	public function new() 
	{
		super();
		buttonMode = true;
		mouseChildren = false;
	}
	
}