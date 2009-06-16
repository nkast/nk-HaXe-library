/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.Lib;
import nk.containers.ContainerMgr;

class Sample extends MovieClip
{	
	var iControlPanel:ControlPanel;
	
	public function new()
	{
		super();
		Init();
	}
	
	var contentMgr:ContainerMgr;

	function Init()
	{
		contentMgr = new ContainerMgr(this);
		
		iControlPanel.iAddMC01.addEventListener(MouseEvent.CLICK, onAddMC01Click);
		iControlPanel.iAddMC02.addEventListener(MouseEvent.CLICK, onAddMC02Click);
		iControlPanel.iAddMC03.addEventListener(MouseEvent.CLICK, onAddMC03Click);
		iControlPanel.iAddMC04.addEventListener(MouseEvent.CLICK, onAddMC04Click);
		iControlPanel.iAddMC05.addEventListener(MouseEvent.CLICK, onAddMC05Click);
		iControlPanel.iClear.addEventListener(MouseEvent.CLICK, onClearClick);
		
	}
	
	function onAddMC01Click(evt:MouseEvent)
	{
		var mc:MovieClip = Lib.attach("Item01");
		contentMgr.AddContent(mc);
	}
	function onAddMC02Click(evt:MouseEvent)
	{
		var mc:MovieClip = Lib.attach("Item02");
		contentMgr.AddContent(mc);
	}
	function onAddMC03Click(evt:MouseEvent)
	{
		var mc:MovieClip = Lib.attach("Item03");
		contentMgr.AddContent(mc);
	}
	function onAddMC04Click(evt:MouseEvent)
	{
		var mc:MovieClip = Lib.attach("Item04");
		contentMgr.AddContent(mc);
	}
	function onAddMC05Click(evt:MouseEvent)
	{
		var mc:MovieClip = Lib.attach("Item05");
		contentMgr.AddContent(mc);
	}
	function onClearClick(evt:MouseEvent)
	{		
		contentMgr.EndAll();
	}
	
	
	
	
	
	
	
	
	
	
}