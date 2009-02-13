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
import flash.geom.Rectangle;

class StackBase 
{
	public var Target(default,null):MovieClip;
	var children:Array<DisplayObject>;
	public var Margin: Rectangle;
	
	private var hGap : Float;
	private var vGap : Float;
	public var hAlign:HAlign;
	public var vAlign:VAlign;
	public var CheckVisibility:Bool;
	
	public function new(mc:MovieClip)
	{
		this.Target = mc;
		children = new Array<DisplayObject>();
		Margin = new Rectangle(0, 0, 0, 0);
		hAlign = HAlign.Left;
		vAlign = VAlign.Top;
		hGap = vGap = 0;
		CheckVisibility = true;
	}
	
	public function AddObj(child:DisplayObject):Void
	{
		children.push(child);
		Update();
	}
	
	public function AddChild(child:DisplayObject):Void
	{
		Target.addChild(child);
		AddObj(child);
	}
	
	public function RemoveAllObj()
	{
		children = new Array<DisplayObject>();
	}
	
	public function RemoveAllChildren()
	{
		for (child in children)
			Target.removeChild(child);
		RemoveAllObj();
	}
	
	public function GetLength():Int
	{
		return children.length;
	}
	
	
	
	private function GetSumItemWidth():Float
	{
		var total:Float=0;
		var child:DisplayObject;
		for (child in children)
		{	
			if (CheckVisibility == true && !child.visible) continue;
			total += child.width;
		}		
		return total;
	}
	
	private function GetSumItemHeight():Float
	{
		var total:Float=0;
		var child:DisplayObject;
		for (child in children)
		{	
			if (CheckVisibility == true && !child.visible) continue;
			total += child.height;
		}
		return total;
	}
	
	private function GetMaxItemWidth():Float
	{
		var max:Float=0;
		var child:DisplayObject;
		for (child in children)
		{	
			if (CheckVisibility == true && !child.visible) continue;
			max = Math.max(max,child.width);
		}		
		return max;
	}
	
	private function GetMaxItemHeight():Float
	{
		var max:Float=0;
		var child:DisplayObject;
		for (child in children)
		{	
			if (CheckVisibility == true && !child.visible) continue;
			max = Math.max(max,child.height);
		}		
		return max;
	}
	
	public function Update():Void;
	public function SetGap(gap:Float):Void;
	
}