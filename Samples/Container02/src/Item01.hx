/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import feffects.easing.Elastic;
import feffects.easing.Linear;
import feffects.Tween;
import nk.containers.ContentPageBase;

class Item01 extends ContentPageBase
{

	public function new() 
	{
		super();
		visible = false;
		alpha = 0;
	}
	
	function onTweenUpdate( e : Float )
	{
		this.alpha = e;
	}	
	function TweenEnd( e : Float )
	{
		onEndComplete();
	}
	
	public override function Begin()
	{		
		super.Begin();
	
		visible = true;
		var t = new Tween( this, alpha, 1, 2000 );
		t.setEasing(  Linear.easeInOut );
		t.setTweenHandlers( onTweenUpdate,  function(e){} );
		t.start();
		
		return;
	}
	
	public override function End()
	{		
		super.End();
		
		var t = new Tween( this, alpha, 0, 1000 );
		t.setEasing(  Linear.easeInOut );
		t.setTweenHandlers( onTweenUpdate,  TweenEnd );
		t.start();
		
		
		//TweenMax.delayedCall(1.1, onEndComplete);
	}
	
	
}