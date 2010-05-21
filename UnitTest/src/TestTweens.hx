/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.Lib;
import nk.transitions.tween.HXT;
import nk.transitions.tween.HXTweenMgr;

class TestTweens 
{
	public function new() 
	{
		var b01:Ball = cast Lib.current.addChild(new Ball(20));
		b01.y = 50;
		trace(HXTweenMgr.Current);
		HXT.tween(b01, 4);
		
		return;
	}
	
}