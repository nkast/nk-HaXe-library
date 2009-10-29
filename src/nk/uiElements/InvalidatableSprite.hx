/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.uiElements;
import flash.display.Sprite;

class InvalidatableSprite extends Sprite, implements IInvalidatable
{
	private var isInvalid:Bool;
	
	public function new()
	{
		super();
		isInvalid = false;
	}
	
	public function Invalidate():Void
	{
		isInvalid = true;
	}
	public function IsInvalid():Bool
	{
		return isInvalid;
	}
	public function ValidateNow():Void
	{
		if(IsInvalid()) Paint();
	}
	private function Paint():Void;
	
}