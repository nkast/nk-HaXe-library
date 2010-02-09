/**
 nkHaxeLibrary v0.7.0alpha
 Copyright (c) 2009 Kastellanos Nikos

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
 */

package nk.layoutManager;
import flash.display.DisplayObject;
import flash.events.Event;
import flash.Lib;

class StageStretch 
{
	var target:DisplayObject;
	var dir:Direction;
	
	public function new(target:DisplayObject,?dir:Direction)
	{
		this.target = target;
		if (dir == null) dir = Direction.Both;
		this.dir = dir;
		
		Lib.current.stage.addEventListener(Event.RESIZE, onResize);		
		Resize();
	}
	
	function onResize(e:Event):Void
	{
		Resize();
	}
	
	function Resize()
	{
		target.x = 0;
		target.y = 0;
		if(dir == Direction.Both || dir == Direction.Horizontal) target.width = Lib.current.stage.stageWidth;
		if(dir == Direction.Both || dir == Direction.Vertical) target.height = Lib.current.stage.stageHeight;
		
		return;
	}
	
}