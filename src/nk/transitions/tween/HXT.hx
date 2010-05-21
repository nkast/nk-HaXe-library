/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.transitions.tween;

class HXT extends HXTweenMgr
{
	public static function tween(target:Dynamic, duration:Float):Tween
	{
		var tween:Tween = new Tween(target, duration);
		
		return tween;
	}
	
	
}