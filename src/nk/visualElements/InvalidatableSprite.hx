﻿/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.visualElements;
import flash.display.Sprite;

class InvalidatableSprite extends Sprite, implements IInvalidatable
{
	private var isInvalid:Bool;
	
	public function new()
	{
		super();
		isInvalid = true;
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