/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.general;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.Lib;

class Caption extends MovieClip
{
	var target:MovieClip;
	var title:String;
	
	public function new(target:MovieClip,title:String)
	{
		super();
		
		if (title == "") return;
		
		this.target = target;
		this.title = title;
		
		mouseEnabled = false;
		mouseChildren = false;
		
		target.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		target.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	}
		
	private function onMouseOver(evt:MouseEvent)
	{		
		Lib.current.addChild(this);
		target.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
	}
	
	private function onMouseOut(evt:MouseEvent)
	{	
		Lib.current.removeChild(this);
		target.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
	}
	
	private function onMouseMove(evt:MouseEvent)
	{
		this.x = evt.stageX;
		this.y = evt.stageY;
	}
	
	
}