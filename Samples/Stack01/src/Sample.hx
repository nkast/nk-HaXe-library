/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.Lib;
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
		iControlPanel.iHAlignLeft.iLabel.text = "Left";
		iControlPanel.iHAlignLeft.iLabel.text = "Center";
		iControlPanel.iHAlignLeft.iLabel.text = "Right";
		iControlPanel.iHAlignLeft.addEventListener(MouseEvent.CLICK, onHAlignLeftClick);
		iControlPanel.iHAlignLeft.addEventListener(MouseEvent.CLICK, onHAlignCenterClick);
		iControlPanel.iHAlignLeft.addEventListener(MouseEvent.CLICK, onHAlignRightClick);
		
		SH();
		
	}
	
	function onHAlignClick(evt:MouseEvent)
	{
		
	}
	
	function SH()
	{
		stack = new StackHorizontal(iTargetPlace, 0);
		stack.AddChild(Lib.attach("Item01"));
		stack.AddChild(Lib.attach("Item02"));
		stack.AddChild(Lib.attach("Item03"));
		
	}
	
	
	
	
	
}