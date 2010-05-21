/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.Sprite;

class Ball extends Sprite
{
	public function new(r:Float) 
	{
		super();
		graphics.beginFill(0x000000);
		graphics.drawCircle(0, 0, r);
		graphics.endFill();
	}	
}