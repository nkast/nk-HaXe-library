/**
* ...
* @author Kastellanos Nikos
*/

package nk.menu;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.Lib;
import flash.utils.Timer;


class MenuContainerBase extends MovieClip
{
	public var parentBtn:MenuBtnBase;
	
	public var state(default,null):MenuContainerInteractionState;
	private var menuBtnList:Array<MenuBtnBase>;
	private var autoCloseTimer:Timer;
	
	public var AutoClose:Bool;
	public var AlwaysOpen:Bool;
	
	
	public function new(parentBtn:MenuBtnBase)
	{
		super();
		menuBtnList = new Array<MenuBtnBase>();
		this.parentBtn = parentBtn;
		
		AutoClose = true;
		AlwaysOpen = true;
		
		state = MenuContainerInteractionState.Open;
		autoCloseTimer = new Timer(1000*0.8);
		
		autoCloseTimer.addEventListener(TimerEvent.TIMER, onCloseTimer);
	}
	
	public function AddMenuBtn(menuBtn:MenuBtnBase):MenuBtnBase
	{
		menuBtnList.push(menuBtn);
		menuBtn.parentContainer = this;
		
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_ADDED, menuBtn));
		
		return menuBtn;
	}
	
	
	public function StartCloseTimer()
	{		
		if (AlwaysOpen) return;
		
		if (state == MenuContainerInteractionState.Closed) return;
		
		if(AutoClose)
		{
			SetClosingState();
			autoCloseTimer.reset();
			autoCloseTimer.start();
			
			stage.addEventListener(MouseEvent.MOUSE_UP, onStageMouseDown);
		}
	}
	
	private function onStageMouseDown(evt:MouseEvent)
	{
		Close();
		stage.removeEventListener(MouseEvent.MOUSE_UP, onStageMouseDown);
	}
	
	public function Open()
	{		
		SetOpenState();
		autoCloseTimer.stop();
		
		visible = true;
	}
	
	public function Close()
	{
		if (AlwaysOpen) return;
		autoCloseTimer.stop();
		SetClosedState();
		visible = false;
	}
	
	public function onCloseTimer(evt:TimerEvent)
	{
		if (state == MenuContainerInteractionState.Closed ) return;
		Close();
	}
	
	public function GetMenuBtnList():Array<MenuBtnBase>
	{
		return menuBtnList;
	}
	
	public function UnselectAll():Void
	{
		_propDown_MenuBtnSelected(null);
		//var itemMenuBtn:MenuBtnBase;
		//for (itemMenuBtn in menuBtnList)
		//{			
		//	itemMenuBtn._propDown_MenuBtnSelected();
		//}
	}
	
	
	public function SelectFirstMenuBtn():Void
	{
		if (menuBtnList.length > 0)
			menuBtnList[0].Select();
	}
	
	public function SelectLastMenuBtn():Void
	{
		if (menuBtnList.length > 0) 			
			menuBtnList[menuBtnList.length-1].Select();
	}
	
	
	// Only to be called from owner MenuBtn.
	public function _propUp_MenuBtnSelected(menuBtn:MenuBtnBase)
	{
		//deselect all sliblings of calling menuBtn
		var itemMenuBtn:MenuBtnBase;
		for (itemMenuBtn in menuBtnList)
		{
			if (menuBtn == itemMenuBtn) continue;			
			itemMenuBtn._propDown_MenuBtnSelected(this);
		}
		if (parentBtn != null)
		{
			parentBtn._propUp_MenuBtnSelected(this);
		}
			
		Close();
	}
	
	public function _propDown_MenuBtnSelected(menuBtn:MenuBtnBase)
	{
		for (itemMenuBtn in menuBtnList)
		{						
			itemMenuBtn._propDown_MenuBtnSelected(this);
		}		
	}
	
	
	// Only to be called from owner MenuBtn.
	public function _propDown_MenuBtnActivated()
	{		
		SetOpenState();
		autoCloseTimer.stop();
		
		visible = true;
	}
	
	// Only to be called from owner MenuBtn.
	public function _propDown_MenuBtnDeactivated()
	{		
		SetClosingState();
		StartCloseTimer();
	}
	
	// Only to be called from child MenuBtn.
	public function _propUp_MenuBtnActivated(menuBtn:MenuBtnBase)
	{
		SetOpenFromChildState();
		autoCloseTimer.stop();
		visible = true;
		
		//close all sliblings of calling menuBtn
		var itemMenuBtn:MenuBtnBase;
		for (itemMenuBtn in menuBtnList)
		{			
			if (menuBtn == itemMenuBtn) continue;
			itemMenuBtn.DeactivateAndClose();
		}

		//Inform parent btn
		
	}
	
	// Only to be called from child MenuBtn.
	public function _propUp_MenuBtnDeactivated()
	{
		SetClosingState();
		StartCloseTimer();
	}
	
	
	//Internal.
	private function SetOpenState()
	{
		state = MenuContainerInteractionState.Open;
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, null));
	}
	//Internal.
	private function SetOpenFromChildState()
	{
		state = MenuContainerInteractionState.OpenFromChild;
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, null));
	}
	//Internal.
	private function SetClosingState()
	{
		state = MenuContainerInteractionState.Closing;
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, null));
	}	
	//Internal.
	private function SetClosedState()
	{
		state = MenuContainerInteractionState.Closed;
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, null));
	}
	
}