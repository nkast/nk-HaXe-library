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

package nk.general;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.Lib;

class Caption extends MovieClip
{
	var target:DisplayObject;
	var title:String;
	
	public function new(target:DisplayObject,title:String)
	{
		super();
		
		this.target = target;
		this.title = title;
		
		mouseEnabled = false;
		mouseChildren = false;
		
		target.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		target.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	}
		
	private function onMouseOver(evt:MouseEvent)
	{		
		Lib.current.stage.addChild(this);
		target.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
	}
	
	private function onMouseOut(evt:MouseEvent)
	{	
		Lib.current.stage.removeChild(this);
		target.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
	}
	
	private function onMouseMove(evt:MouseEvent)
	{
		this.x = evt.stageX;
		this.y = evt.stageY;
	}
	
	
}