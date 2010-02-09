/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.Lib;
import nk.tools.FPS;
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
	var triangleC:Triangle;
	var triangleD:Triangle;
	
	public function new() 
	{
		super();
		Lib.current.addChild(addChild(new FPS()) );
		Init();
	}
	
	function Init()
	{
		triangleA = InitTriangle(10, 10, 100, 180, 150, 150 , 0x80FFFFFF);
		triangleB = InitTriangle(220,60, 300,200, 350,250 , 0x800000FF);
		triangleC = InitTriangle(10, 10, 100, 180, 150, 150 , 0x80FF40C0);
		triangleD = InitTriangle(220,60, 300,200, 350,250 , 0x80FFFF00);		
		
		triangleB.Stroke = 0xFF8080FF;
		triangleC.Stroke = 0xFFFFA0FF;
		triangleD.Stroke = 0xFFFFFF40;
		
		return;
	}
	
	function InitTriangle(X1,Y1, X2,Y2, X3,Y3, fillcolor:UInt)
	{
		var triangle:Triangle = cast addChild(new Triangle());
		
		triangle.X1 = X1;
		triangle.Y1 = Y1;
		triangle.X2 = X2;
		triangle.Y2 = Y2;
		triangle.X3 = X3;
		triangle.Y3 = Y3;
		
		triangle.Stroke = 0xFFFFFFFF;
		triangle.Fill = new SolidColorBrush(fillcolor);
		
		triangle.Invalidate();
		triangle.ValidateNow();
		
		var rtAX1:RandTween = new RandTween(triangle, "X1", 540);
		var rtAY1:RandTween = new RandTween(triangle, "Y1", 320);
		var rtAX2:RandTween = new RandTween(triangle, "X2", 540);
		var rtAY2:RandTween = new RandTween(triangle, "Y2", 320);
		var rtAX3:RandTween = new RandTween(triangle, "X3", 540);
		var rtAY3:RandTween = new RandTween(triangle, "Y3", 320);
		
		return triangle;
	}
	
	
	
	
}