/**
 * ...
 * @author Kastellanos Nikos
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