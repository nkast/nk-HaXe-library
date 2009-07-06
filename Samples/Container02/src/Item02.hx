/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import feffects.easing.Elastic;
import feffects.easing.Linear;
import feffects.Tween;
import nk.containers.ContentPageBase;

class Item02 extends ContentPageBase
{

	public function new() 
	{
		super();
		visible = false;
		x = 600;
	}
	
	function onTweenUpdate( e : Float )
	{
		this.x = e;
	}	
	function TweenEnd( e : Float )
	{
		onEndComplete();
	}
	
	public override function Begin()
	{		
		super.Begin();
		
		visible = true;		
		var t = new Tween( this, x, 0, 1400 );
		t.setEasing(  Linear.easeInOut );
		t.setTweenHandlers( onTweenUpdate,  function(e){} );
		t.start();
		
		return;
	}
	
	public override function End()
	{		
		super.End();
		
		var t = new Tween( this, x, 600, 800 );
		t.setEasing(  Linear.easeInOut );
		t.setTweenHandlers( onTweenUpdate,  TweenEnd );
		t.start();
		
	}
	
	
}