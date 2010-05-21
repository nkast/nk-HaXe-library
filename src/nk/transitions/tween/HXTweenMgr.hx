/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.transitions.tween;
import flash.Lib;
import haxe.Timer;
import haxe.TimerQueue;

class HXTweenMgr 
{
	// sigleton	
	public static var Current(getCurrent, null):HXTweenMgr;
	private static var _instance:HXTweenMgr;
	static function getCurrent():HXTweenMgr
	{
		if (_instance == null) _instance = new HXTweenMgr();
		return _instance;
	}
	
	public var TimeStamp(default,null):Float;
	
	var timer:Timer;	
	var tweenArray:Array<Tween>;
	
	private function new()
	{
		Init();
	}
	
	function Init()
	{
		tweenArray	= new Array<Tween>();
		
		//init timer
		var interval:Int = Std.int(1000/Lib.current.stage.frameRate);
		timer = new haxe.Timer( interval );
		timer.run = this.onTimerInterval;
		trace(interval);
	}
	
	function onTimerInterval()
	{
		TimeStamp = Timer.stamp();
		for (tween:Tween in tweenArray)
		{			
			
		}
		return;
	}
	
	
	
}