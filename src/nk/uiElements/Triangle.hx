/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.uiElements;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.Lib;

class Triangle extends InvalidatableSprite
{
	var _stroke:UInt;
	var _fill:Brush;
	var _X1:Float;
	var _Y1:Float;
	var _X2:Float;
	var _Y2:Float;
	var _X3:Float;
	var _Y3:Float;
	
	public var Stroke(get_Stroke,set_Stroke):UInt;
	public var Fill(get_Fill,set_Fill):Brush;
	public var X1(get_X1,set_X1):Float;
	public var Y1(get_Y1,set_Y1):Float;
	public var X2(get_X2,set_X2):Float;
	public var Y2(get_Y2,set_Y2):Float;
	public var X3(get_X3,set_X3):Float;
	public var Y3(get_Y3, set_Y3):Float;
	
	
	public function new(?pt1:Point,?pt2:Point,?pt3:Point) 
	{
		super();
		
		_stroke = 0xFF000000;
		_fill = new SolidColorBrush();
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
	
	function get_Stroke():UInt { return _stroke; }
	function set_Stroke(value:UInt):UInt { Invalidate(); return (_stroke = value); }
	function get_Fill():Brush { return _fill; }
	function set_Fill(value:Brush):Brush { Invalidate(); return (_fill = value); }
	
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
		_fill.BeginFill(this);
		graphics.lineStyle(1, (_stroke&0xFFFFFF) , (_stroke>>>24)/255 );
		graphics.moveTo(X1, Y1);
		graphics.lineTo(X2, Y2);
		graphics.lineTo(X3, Y3);
		graphics.endFill();
		
		return;
	}
	
	
}