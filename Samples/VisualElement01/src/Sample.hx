/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import nk.visualElements.SolidColorBrush;
import nk.visualElements.Triangle;
import feffects.easing.Elastic;
import feffects.easing.Circ;
import feffects.easing.Sine;

import feffects.Tween;

class Sample extends MovieClip
{
	var triangleA:Triangle;
	var triangleB:Triangle;
	var tAX1:Tween;
	var tBY3:Tween;
	
	
	public function new() 
	{
		super();
		Init();
	}
	
	function Init()
	{
		triangleA = cast addChild(new Triangle());
		triangleB = cast addChild(new Triangle());
		
		triangleA.X1 = 10;
		triangleA.Y1 = 10;
		triangleA.X2 = 100;
		triangleA.Y2 = 180;
		triangleA.X3 = 150;
		triangleA.Y3 = 150;
		
		triangleB.X1 = 220;
		triangleB.Y1 = 60;
		triangleB.X2 = 300;
		triangleB.Y2 = 200;
		triangleB.X3 = 350;
		triangleB.Y3 = 250;
		
		triangleA.Stroke = 0xFFFFFFFF;
		triangleB.Stroke = 0xFF8080FF;
		triangleA.Fill = new SolidColorBrush(0x80FFFFFF);
		triangleB.Fill = new SolidColorBrush(0x800000FF);
		
		
		triangleA.Invalidate();
		triangleB.Invalidate();
		triangleA.ValidateNow();
		triangleB.ValidateNow();
		
		var rtAX1:RandTween = new RandTween(triangleA, "X1", 540);
		var rtAY1:RandTween = new RandTween(triangleA, "Y1", 320);
		var rtAX2:RandTween = new RandTween(triangleA, "X2", 540);
		var rtAY2:RandTween = new RandTween(triangleA, "Y2", 320);
		var rtAX3:RandTween = new RandTween(triangleA, "X3", 540);
		var rtAY3:RandTween = new RandTween(triangleA, "Y3", 320);
		
		
		var rtBX1:RandTween = new RandTween(triangleB, "X1", 540);
		var rtBY1:RandTween = new RandTween(triangleB, "Y1", 320);
		var rtBX2:RandTween = new RandTween(triangleB, "X2", 540);
		var rtBY2:RandTween = new RandTween(triangleB, "Y2", 320);
		var rtBX3:RandTween = new RandTween(triangleB, "X3", 540);
		var rtBY3:RandTween = new RandTween(triangleB, "Y3", 320);
		
		
	}
	
	function onAX1Update( e : Float )
	{
		triangleA.X1 = e;
		triangleA.ValidateNow();
	}	
	
	function onBY3Update( e : Float )
	{	
		triangleB.Y3 = e;
		triangleB.ValidateNow();
	}
	
	function onAX1Complete( e : Float )
	{
		tAX1 = new Tween( triangleA, triangleA.X1 , triangleA.X1-130, 4000 );
		tAX1.setEasing(  Sine.easeInOut );
		tAX1.setTweenHandlers( onAX1Update ,  function(e){} );
		tAX1.start();
			
	}	
	
	
	
	
	
}