/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.Lib;
import nk.layoutManager.HAlign;
import nk.layoutManager.StackVertical;
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
	var iTargetPlace1:MovieClip;
	var iTargetPlace2:MovieClip;
	
	var stackH:StackHorizontal;
	var stackV:StackVertical;
	
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
		stackH.hAlign = HAlign.Left;
		stackH.Update();
	}
	function onHAlignCenterClick(evt:MouseEvent)
	{
		stackH.hAlign = HAlign.Center;
		stackH.Update();
	}
	function onHAlignRightClick(evt:MouseEvent)
	{
		stackH.hAlign = HAlign.Right;
		stackH.Update();
	}
	
	function onVAlignTopClick(evt:MouseEvent)
	{
		stackH.vAlign = VAlign.Top;
		stackH.Update();
	}
	function onVAlignMiddleClick(evt:MouseEvent)
	{
		stackH.vAlign = VAlign.Middle;
		stackH.Update();
	}
	function onVAlignBottomClick(evt:MouseEvent)
	{
		stackH.vAlign = VAlign.Bottom;
		stackH.Update();		
	}
	
	
	
	
	function onSetGapClick(evt:MouseEvent)
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text); 		
		var w:Float = Std.parseFloat(iControlPanel.iWidth.text);
		var h:Float = Std.parseFloat(iControlPanel.iWidth.text);
		
		stackH.SetGap(gap);
		trace(w);
		stackH.Margin.width = w;
		
		stackH.Update();
	}
	
	function SH()
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text); 		
		var w:Float = Std.parseFloat(iControlPanel.iWidth.text);
		var h:Float = Std.parseFloat(iControlPanel.iWidth.text);
		
		stackH = new StackHorizontal(iTargetPlace1, gap);
		stackH.AddChild(Lib.attach("Item01"));
		stackH.AddChild(Lib.attach("Item04"));
		stackH.AddChild(Lib.attach("Item02"));
		stackH.AddChild(Lib.attach("Item05"));
		stackH.AddChild(Lib.attach("Item03"));
		
		stackH.Margin.width = w;
		
		
		return;
	}
	
	
	
}