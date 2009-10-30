/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.visualElements;

interface IInvalidatable
{
	private var isInvalid:Bool;
	public function Invalidate():Void;
	public function ValidateNow():Void;
	public function IsInvalid():Bool;
	private function Paint():Void;
}

