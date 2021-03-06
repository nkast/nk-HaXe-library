﻿/**
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
import flash.geom.Rectangle;

class StackHorizontal extends StackBase
{	
	public function new(obj:MovieClip,gap:Float)
	{
		super(obj);		
		hGap = gap;
	}
	
	override public function Update()
	{
		var offsetx:Float = 0;
		var offsety:Float = 0;
		
		var w = GetTotalWidth();
		var h = GetMaxItemHeight();
		
		if (hAlign == HAlign.Center) offsetx = Math.max(0, Width - w) / 2;
		if (hAlign == HAlign.Right)  offsetx = Math.max(0, Width - w);
		
		if (vAlign == VAlign.Middle) offsety = Math.max(0, Height - h) / 2;
		if (vAlign == VAlign.Bottom) offsety = Math.max(0, Height - h);
			
		var posx = Left + offsetx;
		var posy = Top + offsety;
		
		var child:DisplayObject;
		for (child in children)
		{
			child.x = posx;
			child.y = posy;
			
			if (vAlign == VAlign.Middle) child.y = posy + (h - (child.height))/2;
			if (vAlign == VAlign.Bottom) child.y = posy + (h - (child.height));
			
			if (CheckVisibility == true && !child.visible) continue;
			posx += child.width + hGap;
		}
		return;
	}
	
	override public function SetGap(gap:Float):Void
	{
		hGap = gap;
	}
	
	public function GetTotalWidth():Float 
	{		
		return GetSumItemWidth() + hGap * (children.length - 1);
	}
	
	
}