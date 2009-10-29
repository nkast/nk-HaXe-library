/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.uiElements;
import flash.display.GradientType;
import flash.display.SpreadMethod;
import flash.geom.Matrix;
import flash.geom.Point;

class Triangle extends InvalidatableSprite
{	
	var _X1:Float;
	var _Y1:Float;
	var _X2:Float;
	var _Y2:Float;
	var _X3:Float;
	var _Y3:Float;
	
	public var X1(get_X1,set_X1):Float;	
	public var Y1(get_Y1,set_Y1):Float;	
	public var X2(get_X2,set_X2):Float;	
	public var Y2(get_Y2,set_Y2):Float;	
	public var X3(get_X3,set_X3):Float;	
	public var Y3(get_Y3,set_Y3):Float;	
	
	public function new(pt1:Point,pt2:Point,pt3:Point) 
	{
		super();
		
		//set points
		X1 = pt1.x;
		Y1 = pt1.y;
		X2 = pt2.x;
		Y2 = pt2.y;
		X3 = pt3.x;
		Y3 = pt3.y;
		
		ValidateNow(); //Paint!
		
		return;
	}
	
	function get_X1():Float { return _X1; }
	function get_Y1():Float { return _Y1; }
	function get_X2():Float { return _X2; }
	function get_Y2():Float { return _Y2; }
	function get_X3():Float { return _X3; }
	function get_Y3():Float { return _Y3; }
		
	function set_X1(value:Float):Float { Invalidate(); return (_X1 = value); }
	function set_Y1(value:Float):Float { Invalidate(); return (_Y1 = value); }
	function set_X2(value:Float):Float { Invalidate(); return (_X2 = value); }
	function set_Y2(value:Float):Float { Invalidate(); return (_Y2 = value); }
	function set_X3(value:Float):Float { Invalidate(); return (_X3 = value); }
	function set_Y3(value:Float):Float { Invalidate(); return (_Y3 = value); }

	override private function Paint():Void
	{
		graphics.clear();
		//graphics.beginFill(0xFFFFFF, 0.3);
		
		var matrix:Matrix = new Matrix();
		matrix.createGradientBox(150, 150, 0, X1 -(150/2), Y1 -(150/2));
		graphics.beginGradientFill(GradientType.RADIAL,[0xFFFFFF,0xFFFFFF,0xFFFFFF],[0.0,0.6,0.1],[50,80,255],matrix,SpreadMethod.PAD);
		
		graphics.lineStyle(0, 0xFFFFFF, 0);
		graphics.moveTo(X1, Y1);
		graphics.lineTo(X2, Y2);
		graphics.lineTo(X3, Y3);
		//graphics.drawRect(0,0,800,600);
		graphics.endFill();
		
		return;
	}
	
	
}