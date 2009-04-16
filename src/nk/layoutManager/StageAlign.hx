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
import flash.display.MovieClip;
import flash.events.Event;
import flash.geom.PerspectiveProjection;
import flash.geom.Point;
import flash.Lib;
import nk.virtual.VirtualUtil;


class StageAlign 
{
	var target:DisplayObject;
	var hAlign:HAlign;
	var vAlign:VAlign;
	var maxBottom:Float;
	var offset:Point;

	public function new(target:DisplayObject, hAlign:HAlign, vAlign:VAlign,?offset:Point=null, ?maxBottom:Float=-1)
	{
		this.target = target;
		this.hAlign = hAlign;
		this.vAlign = vAlign;		
		if (offset == null) offset = new Point(0, 0);
		this.offset = offset;
		this.maxBottom = maxBottom;
		
		Lib.current.stage.addEventListener(Event.RESIZE, onResize);
		
		Resize();
	}
	
	function onResize(e:Event):Void
	{
		Resize();
	}
	
	public function Resize()
	{	
		switch(hAlign)
		{
			case HAlign.Left: target.x = 0;
			case HAlign.Center: target.x = (Lib.current.stage.stageWidth / 2) - (GetTargetWidth() / 2);
			case HAlign.Right: target.x = (Lib.current.stage.stageWidth) - (GetTargetWidth());
		}
		
		switch(vAlign)
		{
			case VAlign.Top: target.y = 0;
			case VAlign.Middle: target.y = (Lib.current.stage.stageHeight / 2) - (GetTargetHeight() / 2);
			case VAlign.Bottom: target.y = (Lib.current.stage.stageHeight) - (GetTargetHeight());
		}
		
		if (vAlign != null && maxBottom != -1)
			target.y = Math.min(target.y, maxBottom-GetTargetHeight());

		//apply offset
		if (hAlign != null ) target.x += offset.x;
		if (vAlign != null ) target.y += offset.y;
		
		return;
	}
	
	public var VerticalAlign(getVAlign,setVAlign):VAlign;
	function getVAlign():VAlign      { return vAlign; }
	function setVAlign(value:VAlign) { vAlign = value; Resize();  return vAlign; }
	
	public var Offset(getOffset,setOffset):Point;
	function getOffset():Point      { return offset; }
	function setOffset(value:Point) { offset = value; Resize();  return offset; }
	
	
	private function GetTargetWidth():Float
	{		
		return VirtualUtil.Width(target);		
	}
	
	private function GetTargetHeight():Float
	{
		return VirtualUtil.Height(target);		
	}
	
}