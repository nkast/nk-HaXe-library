/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.visualElements;
import flash.display.Sprite;

class SolidColorBrush extends Brush
{
	var _color:UInt;
	public function new(?color:UInt = 0xFF000000) 
	{
		super();
		this._color = color;
	}
	
	public override function BeginFill(target:Sprite) 
	{
		target.graphics.beginFill( (_color&0xFFFFFF) , (_color>>>24)/255 );
	}	
	
}