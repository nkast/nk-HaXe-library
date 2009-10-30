/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import feffects.easing.Sine;
import feffects.Tween;
import flash.display.Sprite;
import nk.visualElements.Triangle;

class RandTween 
{
	var tween:Tween;
	var target:Triangle;
	var field:String;
	var max:Float;
	
	public function new(target:Triangle,field:String,max:Float) 
	{		
		this.target = target;
		this.field = field;
		this.max = max;
		Start();		
	}
	
	function Start()
	{
		var initValue:Float = untyped target[field];
		tween = new Tween( this , initValue , Math.random()*max , 1000 + Math.floor(2000*Math.random()) );
		tween.setEasing( Sine.easeInOut );
		tween.setTweenHandlers( onUpdate ,  onComplete );
		tween.start();
	}
	
	function onUpdate(e : Float)
	{		
		untyped { target[field] = e; };
		target.ValidateNow();
	}
	
	function onComplete(e : Float)
	{
		Start();
	}
	
}