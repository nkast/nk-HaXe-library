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
		
		iControlPanel.iSetGap.addEventListener(MouseEvent.CLICK, onSetClick);
		
		SH();
		SV();
	}
	
	function onHAlignLeftClick(evt:MouseEvent)
	{
		stackH.hAlign = HAlign.Left;
		stackH.Update();
		stackV.hAlign = HAlign.Left;
		stackV.Update();
	}
	function onHAlignCenterClick(evt:MouseEvent)
	{
		stackH.hAlign = HAlign.Center;
		stackH.Update();
		stackV.hAlign = HAlign.Center;
		stackV.Update();
	}
	function onHAlignRightClick(evt:MouseEvent)
	{
		stackH.hAlign = HAlign.Right;
		stackH.Update();
		stackV.hAlign = HAlign.Right;
		stackV.Update();
	}
	
	function onVAlignTopClick(evt:MouseEvent)
	{
		stackH.vAlign = VAlign.Top;
		stackH.Update();
		stackV.vAlign = VAlign.Top;
		stackV.Update();
	}
	function onVAlignMiddleClick(evt:MouseEvent)
	{
		stackH.vAlign = VAlign.Middle;
		stackH.Update();
		stackV.vAlign = VAlign.Middle;
		stackV.Update();
	}
	function onVAlignBottomClick(evt:MouseEvent)
	{
		stackH.vAlign = VAlign.Bottom;
		stackH.Update();
		stackV.vAlign = VAlign.Bottom;
		stackV.Update();
	}
	
	
	
	
	function onSetClick(evt:MouseEvent)
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text); 		
		var w:Float = Std.parseFloat(iControlPanel.iWidth.text);
		var h:Float = Std.parseFloat(iControlPanel.iHeight.text);
		
		stackH.SetGap(gap);
		stackH.Margin.width = w;
		stackH.Margin.height = h;
		stackH.Update();
		
		stackV.SetGap(gap);
		stackV.Margin.width = w;
		stackV.Margin.height = h;
		stackV.Update();
		
	}
	
	function SH()
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text); 		
		var w:Float = Std.parseFloat(iControlPanel.iWidth.text);
		var h:Float = Std.parseFloat(iControlPanel.iHeight.text);
		
		stackH = new StackHorizontal(iTargetPlace1, gap);
		stackH.AddChild(Lib.attach("Item01"));
		stackH.AddChild(Lib.attach("Item04"));
		stackH.AddChild(Lib.attach("Item02"));
		stackH.AddChild(Lib.attach("Item05"));
		stackH.AddChild(Lib.attach("Item03"));
		
		stackH.Margin.width = w;
		stackH.Margin.height = h;
		
		return;
	}
	
	function SV()
	{
		var gap:Float = Std.parseFloat(iControlPanel.iGap.text);	
		var w:Float = Std.parseFloat(iControlPanel.iWidth.text);
		var h:Float = Std.parseFloat(iControlPanel.iHeight.text);
		
		stackV = new StackVertical(iTargetPlace2, gap);
		stackV.AddChild(Lib.attach("Item01"));
		stackV.AddChild(Lib.attach("Item04"));
		stackV.AddChild(Lib.attach("Item02"));
		stackV.AddChild(Lib.attach("Item05"));
		stackV.AddChild(Lib.attach("Item03"));
		
		stackV.Margin.width = w;
		stackV.Margin.height = h;
		
		return;
	}
	
	
	
}