/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.Lib;
import nk.layoutManager.HAlign;
import nk.layoutManager.VAlign;
import nk.layoutManager.StackHorizontal;


class Sample extends MovieClip
{

	public function new()
	{
		super();
		Init();
	}

	var iControlPanel:ControlPanel;
	var iTargetPlace:MovieClip;
	
	var stack:StackHorizontal;
	
	function Init()
	{
		iControlPanel.iHAlignLeft.addEventListener(MouseEvent.CLICK, onHAlignLeftClick);
		iControlPanel.iHAlignCenter.addEventListener(MouseEvent.CLICK, onHAlignCenterClick);
		iControlPanel.iHAlignRight.addEventListener(MouseEvent.CLICK, onHAlignRightClick);
		
		iControlPanel.iVAlignTop.addEventListener(MouseEvent.CLICK, onVAlignTopClick);
		iControlPanel.iVAlignMiddle.addEventListener(MouseEvent.CLICK, onVAlignMiddleClick);
		iControlPanel.iVAlignBottom.addEventListener(MouseEvent.CLICK, onVAlignBottomClick);
		
		iControlPanel.iSetGap.addEventListener(MouseEvent.CLICK, onSetGapClick);
		
		SH();
	}
	
	function onHAlignLeftClick(evt:MouseEvent)
	{
		stack.hAlign = HAlign.Left;
		stack.Update();
	}
	function onHAlignCenterClick(evt:MouseEvent)
	{
		stack.hAlign = HAlign.Center;
		stack.Update();
	}
	function onHAlignRightClick(evt:MouseEvent)
	{
		stack.hAlign = HAlign.Right;
		stack.Update();
	}
	
	function onVAlignTopClick(evt:MouseEvent)
	{
		stack.vAlign = VAlign.Top;
		stack.Update();
	}
	function onVAlignMiddleClick(evt:MouseEvent)
	{
		stack.vAlign = VAlign.Middle;
		stack.Update();
	}
	function onVAlignBottomClick(evt:MouseEvent)
	{
		stack.vAlign = VAlign.Bottom;
		stack.Update();		
	}
	
	
	
	
	function onSetGapClick(evt:MouseEvent)
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text); 		
		stack.SetGap(gap);
		stack.Update();
	}
	
	function SH()
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text); 		
		stack = new StackHorizontal(iTargetPlace, gap);
		stack.AddChild(Lib.attach("Item01"));
		stack.AddChild(Lib.attach("Item04"));
		stack.AddChild(Lib.attach("Item02"));
		stack.AddChild(Lib.attach("Item05"));
		stack.AddChild(Lib.attach("Item03"));
		
		stack.Margin.width = 300;
		
		
		return;
	}
	
	
	
}