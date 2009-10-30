/**
 * ...
 * @author Kastellanos Nikos 
 */

package nk.visualElements;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.Lib;

class Triangle extends InvalidatableSprite
{
	public var Stroke:UInt;
	public var Fill:Brush;
	public var X1:Float;
	public var Y1:Float;
	public var X2:Float;
	public var Y2:Float;
	public var X3:Float;
	public var Y3:Float;
	
	public function new(?pt1:Point,?pt2:Point,?pt3:Point) 
	{
		super();
		
		Stroke = 0xFF000000;
		Fill = new SolidColorBrush();
		//set points
		X1 = (pt1!=null)? pt1.x : 0 ;
		Y1 = (pt1!=null)? pt1.y : 0 ;
		X2 = (pt2!=null)? pt2.x : 0 ;
		Y2 = (pt2!=null)? pt2.y : 0 ;
		X3 = (pt3!=null)? pt3.x : 0 ;
		Y3 = (pt3!=null)? pt3.y : 0 ;
		
		ValidateNow(); //Paint!
		
		return;
	}
	
	override private function Paint():Void
	{
		graphics.clear();
		Fill.BeginFill(this);
		graphics.lineStyle(1, (Stroke&0xFFFFFF) , (Stroke>>>24)/255 );
		graphics.moveTo(X1, Y1);
		graphics.lineTo(X2, Y2);
		graphics.lineTo(X3, Y3);
		graphics.endFill();
		
		return;
	}
	
	
}